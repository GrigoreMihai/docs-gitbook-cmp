#!/bin/sh -e

# Image checks
# =============================================================================

# Unused images
# -----------------------------------------------------------------------------

echo 'Checking unused images...'

find docs/.gitbook/assets -type f | while read -r file; do
    asset_basename="$(basename "${file}")"
    if ! grep -rsqF "${asset_basename}" --include="*.md" docs; then
        echo "Unused image: ${file}"
    fi
done

# Image filenames
# -----------------------------------------------------------------------------

echo 'Checking image filenames...'

check_basename() {
    basename="${1}"
    # Check stem for valid characters
    echo "${basename}" | grep -Eq '^[a-z0-9-]+\..+$' || {
        return 1
    }
    # Check disallowed words
    echo "${basename}" | grep -Eqv '(image|shot)' || {
        return 1
    }
    # Check for numbers that do not directly precede the extension (with
    # allowed exceptions filtered out)
    echo "${basename}" |
        sed 's,office-365,,' | sed 's,s3,,' |
        grep -Eqv '[0-9][^.0-9]' || {
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
        echo "Invalid filename: docs/.gitbook/assets/${asset_basename}"
        echo 1 >"${status_code_file}"
    fi
done

status_code="$(cat "${status_code_file}")"
exit "${status_code}"
