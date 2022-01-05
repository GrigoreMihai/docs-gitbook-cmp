#!/bin/sh -e

# Miscellaneous checks
# =============================================================================

OUTPUT_FILE='/tmp/ci-output.txt'

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

# Word case
# -----------------------------------------------------------------------------

echo 'Checking word case...'

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

grep -rsi 'doit' docs |
    grep -v 'DoiT' |
    grep -v 'doitintl' |
    grep -v -- '-doit' |
    grep -v 'doit-' |
    grep -vF "doit\\" \
        >"${tmp_file}" || true

append_tmp_errors 'Word case' "${tmp_file}"

# Markdown
# -----------------------------------------------------------------------------

echo 'Checking Markdown...'

# Try to catch broken Markdown link syntax while allowing other uses of the
# closing `]` bracket. This issue is not flagged by markdownlint.

tmp_file=$(mktemp)

grep -rsiE '[^0-9]\][^( :,]' docs \
    >"${tmp_file}" || true

append_tmp_errors 'Markdown' "${tmp_file}"

# Curly quotes
# -----------------------------------------------------------------------------

echo 'Checking curly quotes...'

tmp_file=$(mktemp)

grep -rsiE "[‘’]" docs \
    >>"${tmp_file}" || true

grep -rsiE '[“”]' docs \
    >>"${tmp_file}" || true

append_tmp_errors 'Curly quotes' "${tmp_file}"

# Unused images
# -----------------------------------------------------------------------------

echo 'Checking unused images...'

# tmp_file=$(mktemp)

# find docs/.gitbook/assets -type f | while read -r file; do
#     asset_basename="$(basename "${file}")"
#     if ! grep -rsqF "${asset_basename}" --include="*.md" docs; then
#         echo "Unused image: ${file}" >>"${tmp_file}"
#     fi
# done

# append_tmp_errors "Unused image" "${tmp_file}"

# cSpell configuration
# -----------------------------------------------------------------------------

echo 'Checking cSpell dictionary sort...'

CSPELL_DICT='.cspell.txt'

tmp_file_ascii=$(mktemp)
tmp_file_sorted=$(mktemp)
iconv -f utf-8 -t ascii <"${CSPELL_DICT}" >"${tmp_file_ascii}"
sort <"${tmp_file_ascii}" >"${tmp_file_sorted}"
if ! diff "${tmp_file_ascii}" "${tmp_file_sorted}" >/dev/null; then
    echo "cSpell dictionary is not sorted: ${CSPELL_DICT}" >>"${OUTPUT_FILE}"
fi

rm -f "${tmp_file_ascii}"
rm -f "${tmp_file_sorted}"

printf 'Checking presence of cSpell dictionary words...'

tmp_script=$(mktemp)
cat >"${tmp_script}" <<EOF
#!/bin/sh -e

word="\${1}"
output_file="\${2}"

printf '.'
if ! grep -rsi "\${word}" --exclude='.cspell.txt' . >/dev/null; then
    echo "cSpell dictionary contains unused word: \${word}" >>"${OUTPUT_FILE}"
fi
EOF
chmod 755 "${tmp_script}"

grep -vE '^!' <"${CSPELL_DICT}" | parallel -k "${tmp_script}"

rm -f "${tmp_script}"

printf '\n'

# Output
# -----------------------------------------------------------------------------

# If there is any output text, print it to the console and exit with a non-zero
# exit code

if test -s "${OUTPUT_FILE}"; then
    cat "${OUTPUT_FILE}"
    exit 1
fi
