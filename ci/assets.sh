#!/bin/sh -e

# Asset checks
# =============================================================================

. ci/common.sh

ASSETS_DIR='docs/.gitbook/assets'
IMGDUPIGNORE_FILE='../.imgdupignore'

root_dir="$(pwd)"

# Orphaned assets
# -----------------------------------------------------------------------------

echo 'Checking orphaned assets...'

errors="$(create_tmp_file)"

find "${ASSETS_DIR}" -type f | while read -r file; do
    asset_basename="$(basename "${file}")"
    if ! grep -rsqF "${asset_basename}" --include="*.md" docs; then
        echo "Orphaned asset: ${file}" >>"${errors}"
    fi
done

check_errors "${errors}"

# Asset filenames
# -----------------------------------------------------------------------------

echo 'Checking asset filenames...'

check_basename() {
    basename="${1}"
    # Check stem for valid characters
    echo "${basename}" | grep -Eq '^[a-z0-9-]+\..+$' || {
        return 1
    }
    # Check disallowed sequences
    echo "${basename}" |
        sed -E 's,(-s3|s3-),,' |
        grep -Eqv '(--|[a-z][0-9]|image|shot)' || {
        return 1
    }
    # Check for numbers that do not directly precede the extension (with
    # allowed exceptions filtered out)
    echo "${basename}" |
        sed 's,office-365,,' | sed -E 's,(-s3|s3-),,' |
        grep -Eqv '[0-9][^.0-9]' || {
        return 1
    }
}

errors="$(create_tmp_file)"

find "${ASSETS_DIR}" -type f | sort | while read -r file; do
    asset_basename="$(basename "${file}")"
    if ! check_basename "${asset_basename}"; then
        echo "Invalid filename: ${ASSETS_DIR}/${asset_basename}" >>"${errors}"
    fi
done

check_errors "${errors}"

# Incorrect asset formats
# -----------------------------------------------------------------------------

echo 'Checking asset formats...'

check_basename() {
    basename="${1}"
    echo "${basename}" | grep -Eq '^.*\.(png|gif|csv)$' || {
        return 1
    }
}

errors="$(create_tmp_file)"

find "${ASSETS_DIR}" -type f | sort | while read -r file; do
    asset_basename="$(basename "${file}")"
    if ! check_basename "${asset_basename}"; then
        echo "Invalid format: ${ASSETS_DIR}/${asset_basename}" >>"${errors}"
    fi
done

check_errors "${errors}"

# Duplicate assets
# -----------------------------------------------------------------------------

echo 'Checking for exact file duplicates...'

test_command fdupes

tmp_repo_copy="$(create_tmp_repo_copy)"

fdupes -qr "${tmp_repo_copy}" | sed "s,${tmp_repo_copy}/,,"

echo 'Checking for approximate image duplicates...'

test_command imgdup2go

cd "${ASSETS_DIR}"

errors="$(create_tmp_file)"

# Verify ignore entries
sed 's, matches: .*,,' <"${IMGDUPIGNORE_FILE}" | while read -r file; do
    if ! test -f "${file}"; then
        echo "Ignored file does not exist: ${file}" >>"${errors}"
    fi
done

# Analyze directory contents and filter out ignored results
imgdup2go -dryrun -algo diff |
    grep 'imgdup2go.go:246' |
    sed 's,.*:246: ,,' |
    grep -vFf "${IMGDUPIGNORE_FILE}" \
        >>"${errors}" ||
    true

check_errors "${errors}"

cd "${root_dir}"

# Uncompressed assets
# -----------------------------------------------------------------------------

echo 'Checking for compressible images...'

cd "${tmp_repo_copy}"

errors="$(create_tmp_file)"

tmp_script="$(create_tmp_file)"
cat >"${tmp_script}" <<EOF
#!/bin/sh -e

file="\${1}"

get_file_size() {
    file="\${1}"
    du -k "\${file}" | cut -f1
}

printf '.'
size_before="\$(get_file_size "\${file}")"
optipng -quiet -strip all "\$file"
size_after="\$(get_file_size "\${file}")"
if test "\${size_before}" -gt "\${size_after}"; then
    png_basename="\$(basename "\${file}")"
    echo "Uncompressed image: ${ASSETS_DIR}/\${png_basename}" >>"${errors}"
fi
EOF
chmod 755 "${tmp_script}"

find "${ASSETS_DIR}" -type f -name '*.png' | sort |
    parallel -k "${tmp_script}"

printf '\n'

if ! check_errors "${errors}"; then
    echo
    echo "Run \`optipng -quiet -strip all FILE\` to fix"
fi

cd "${root_dir}"
