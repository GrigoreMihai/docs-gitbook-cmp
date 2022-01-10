#!/bin/sh -e

# Miscellaneous checks
# =============================================================================

. ci/common.sh

CSPELL_DICT='.cspell.txt'

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

errors="$(create_tmp_file)"

grep -rsi 'doit' docs |
    grep -v 'DoiT' |
    grep -v 'doitintl' |
    grep -v -- '-doit' |
    grep -v 'doit-' |
    grep -vF "doit\\" \
        >"${errors}" || true

check_errors "${errors}"

# Markdown
# -----------------------------------------------------------------------------

echo 'Checking Markdown...'

# Try to catch broken Markdown link syntax while allowing other uses of the
# closing `]` bracket. This issue is not flagged by markdownlint.

# TODO: Catch first line errors (should always start with `---`)

errors="$(create_tmp_file)"

grep -rsiE '[^0-9]\][^( :,]' docs \
    >"${errors}" || true

check_errors "${errors}"

# Curly quotes
# -----------------------------------------------------------------------------

echo 'Checking curly quotes...'

errors="$(create_tmp_file)"

grep -rsiE "[‘’]" docs \
    >>"${errors}" || true

grep -rsiE '[“”]' docs \
    >>"${errors}" || true

check_errors "${errors}"

# cSpell configuration
# -----------------------------------------------------------------------------

echo 'Checking cSpell dictionary sort...'

errors="$(create_tmp_file)"

tmp_file_ascii="$(create_tmp_file)"
tmp_file_sorted="$(create_tmp_file)"

iconv -f utf-8 -t ascii <"${CSPELL_DICT}" >"${tmp_file_ascii}"
sort <"${tmp_file_ascii}" >"${tmp_file_sorted}"
if ! diff "${tmp_file_ascii}" "${tmp_file_sorted}" >/dev/null; then
    echo "cSpell dictionary is not sorted: ${CSPELL_DICT}" >>"${errors}"
fi

check_errors "${errors}"

echo 'Checking presence of cSpell dictionary words...'

errors="$(create_tmp_file)"

tmp_script="$(create_tmp_file)"
cat >"${tmp_script}" <<EOF
#!/bin/sh -e

word="\${1}"

printf '.'
if ! grep -rsiq "\${word}" \
    --exclude='.cspell.txt' \
    --exclude='.git/*' \
    --exclude='*.log' \
    --exclude='archive/*' \
    .; then
    echo "cSpell dictionary contains unused word: \${word}" >>"${errors}"
fi
EOF
chmod 755 "${tmp_script}"

grep -vE '^!' <"${CSPELL_DICT}" | parallel -k "${tmp_script}"

printf '\n'

check_errors "${errors}"
