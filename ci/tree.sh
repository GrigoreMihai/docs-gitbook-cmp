#!/bin/sh -e

# Page tree checks
# =============================================================================

# Orphaned pages
# -----------------------------------------------------------------------------

echo 'Checking orphaned pages...'

find docs -type f -name '*.md' -not -path 'docs/SUMMARY.md' |
    sed 's,docs/,,' |
    while read -r file; do
        if ! grep -rsqF "${file}" docs/SUMMARY.md; then
            echo "Orphaned page: docs/${file}"
        fi
    done
