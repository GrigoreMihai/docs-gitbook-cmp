#!/bin/sh -e

# Common setup for for CI scripts
# =============================================================================

# A list of files to clean up on exit
cleanup_list=$(mktemp)

create_tmp_file() {
    tmp_file="$(mktemp)"
    echo "${tmp_file}" >>"${cleanup_list}"
    echo "${tmp_file}"
}

# Check for error messages and exit with a non-zero exit code if found
check_errors() {
    errors="${1}"
    if test -s "${errors}"; then
        cat "${errors}"
        return 1
    fi
}

# Test that a command can be found (use prior to pipes that would otherwise
# nullify the non-zero return code from a missing command)
test_command() {
    command="${1}"
    if ! which "${command}" >/dev/null 2>&1; then
        echo "ERROR: Command not found: ${command}"
    fi
}

# Create a temporary copy of the repository for testing
#
# Specifically:
#
# - We exclude the `.git` directory because the `fdupes` program provides no
#   way to exclude files
# - We can modify files in place with `optipng` and then discard the results,
#   preserving the original files
create_tmp_repo_copy() {
    tmp_repo_copy="$(mktemp -d)"
    echo "${tmp_repo_copy}" >>"${cleanup_list}"
    rsync -qa . "${tmp_repo_copy}"
    rm -rf "${tmp_repo_copy}/.git"
    echo "${tmp_repo_copy}"
}

# Clean up any temporary files on exit
cleanup() {
    while read -r file; do
        rm -rf "${file}"
    done <"${cleanup_list}"
}

trap cleanup EXIT
