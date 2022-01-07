#!/bin/sh -e

# Asset checks
# =============================================================================

# We use a file to cache the status code because piping to `while` creates a
# subshell, meaning we can't update any variables in the global scope
status_code_file="$(mktemp)"
echo 0 >"${status_code_file}"

check_status_code() {
    status_code="$(cat "${status_code_file}")"
    if test "${status_code}" -ne 0; then
        return "${status_code}"
    fi
}

# Orphaned assets
# -----------------------------------------------------------------------------

echo 'Checking orphaned assets...'

find docs/.gitbook/assets -type f | while read -r file; do
    asset_basename="$(basename "${file}")"
    if ! grep -rsqF "${asset_basename}" --include="*.md" docs; then
        echo "Orphaned asset: ${file}"
    fi
done

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

find docs/.gitbook/assets -type f | sort | while read -r file; do
    asset_basename="$(basename "${file}")"
    if ! check_basename "${asset_basename}"; then
        echo "Invalid filename: docs/.gitbook/assets/${asset_basename}"
        echo 1 >"${status_code_file}"
    fi
done

check_status_code

# Incorrect asset formats
# -----------------------------------------------------------------------------

echo 'Checking asset formats...'

check_basename() {
    basename="${1}"
    echo "${basename}" | grep -Eq '^.*\.(png|gif|csv)$' || {
        return 1
    }
}

# We use a file to cache the status code because the pipe to `while` creates a
# subshell, meaning we can't update any variables in the global scope
status_code_file="$(mktemp)"
echo 0 >"${status_code_file}"

find docs/.gitbook/assets -type f | sort | while read -r file; do
    asset_basename="$(basename "${file}")"
    if ! check_basename "${asset_basename}"; then
        echo "Invalid format: docs/.gitbook/assets/${asset_basename}"
        echo 1 >"${status_code_file}"
    fi
done

check_status_code

# Duplicate assets
# -----------------------------------------------------------------------------

echo 'Checking for exact duplicates...'

# The `fdupes` program provides no way to exclude directories, so we copy the
# repository clone to a temporary directory and remove the `.git` directory
# prior to running `fdupes`
tmp_dir="$(mktemp -d)"
rsync -a . "${tmp_dir}"
rm -rf "${tmp_dir}/.git"

fdupes -r "${tmp_dir}" | sed "s,${tmp_dir}/,,"

rm -rf "${tmp_dir}"

echo 'Checking for approximate duplicates...'

tmp_script=$(mktemp)
cat >"${tmp_script}" <<EOF
#!/bin/sh -e

img_dir="\${1}"
cd "\${img_dir}"

tmp_file="$(mktemp)"

# Verify ignore entries
sed 's, matches: .*,,' <../.imgdupignore | while read -r file; do
    if ! test -f "\${file}"; then
        echo "Ignored file does not exist: \${file}" >>"\${tmp_file}"
    fi
done

# Analyze directory contents and filter out ignored results
imgdup2go -dryrun -algo diff |
    grep 'imgdup2go.go:246' |
    sed 's,.*:246: ,,' |
    grep -vFf ../.imgdupignore \
        >>"\${tmp_file}" ||
    true

if test -s "\${tmp_file}"; then
    cat "\${tmp_file}"
    return 1
fi
EOF
chmod 755 "${tmp_script}"

parallel -k "${tmp_script}" <<EOF
docs/.gitbook/assets
archive/.gitbook/assets
EOF

rm -f "${tmp_script}"

# Uncompressed assets
# -----------------------------------------------------------------------------

# TODO
