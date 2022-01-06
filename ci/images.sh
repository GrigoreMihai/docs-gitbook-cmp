#!/bin/sh -e

# Image checks
# =============================================================================

# Unused images
# -----------------------------------------------------------------------------

echo 'Checking unused images...'

# tmp_file=$(mktemp)

find docs/.gitbook/assets -type f | while read -r file; do
    asset_basename="$(basename "${file}")"
    if ! grep -rsqF "${asset_basename}" --include="*.md" docs; then
        echo "Unused image: ${file}"
    fi
done
