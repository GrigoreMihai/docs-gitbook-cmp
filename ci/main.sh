#!/bin/sh -e

# Continuous integration script for GitHub Actions
# =============================================================================

OUTPUT_FILE="/tmp/ci-output.txt"

# Reset the output file
rm -f "$OUTPUT_FILE"

append_tmp_errors() {
    type="${1}"
    tmpfile="${2}"
    if test -s "${tmpfile}"; then
        echo "${type} errors:" >>"${OUTPUT_FILE}"
        cat <"${tmpfile}" >>"${OUTPUT_FILE}"
    fi
    rm -f "${tmpfile}"
}

# Glossary
# -----------------------------------------------------------------------------

# NOTE: Commented out until the tooling matures

# Install the latest version of the DoiT DocOps Utilities from the Python
# Package Index (PyPI). See <https://github.com/doitintl/docops-utils>
# for more details.

# pipx install doitintl-docops

# Run a basic glossary terms analysis. This feature is still in active
# development, so the output from this command is only informational
# purposes only. This step should never fail.

# docops-gloss-terms --quiet docs

# Word case
# -----------------------------------------------------------------------------

# In regular prose, "DoiT" should be capitalized properly. However, in some
# contexts, it is appropriate to use lowercase.
#
# The proper way to test for this would involve the use of a tool that
# understands the semantics of the markup language (e.g., Vale) and knows that,
# for example, to ignore quoted literals and code blocks.
#
# Implementing Vale is going to be involved project, so this is a temporary
# bodge. For now, we string a bunch of greps together to filter out all the
# acceptable uses of the word. If anything remains, we echo it to the log and
# raise an error.

tmp_file=$(mktemp)

grep -rsi "doit" docs |
    grep -v "DoiT" |
    grep -v "doitintl" |
    grep -v -- '-doit' |
    grep -v 'doit-' |
    grep -v 'doit\\' \
        >"${tmp_file}" || true

append_tmp_errors "Word case" "${tmp_file}"

# Markdown
# -----------------------------------------------------------------------------

# Try to catch broken Markdown link syntax while allowing other uses of the
# closing `]` bracket. This issue is not flagged by markdownlint.

tmp_file=$(mktemp)

grep -rsiE '[^0-9]\][^( :,]' docs \
    >"${tmp_file}" || true

append_tmp_errors "Markdown" "${tmp_file}"

# Output
# -----------------------------------------------------------------------------

# If there is any output text, print it to the console and exit with a non-zero
# exit code

if test -s "${OUTPUT_FILE}"; then
    cat "${OUTPUT_FILE}"
    exit 1
fi
