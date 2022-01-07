#!/bin/sh -ex

tmpdir=$(mktemp -d)

cd "${tmpdir}"

# Alpine
# -----------------------------------------------------------------------------

apk update
apk upgrade

apk add --no-cache \
    alpine-sdk \
    zlib-dev \
    jpeg-dev \
    util-linux \
    rsync \
    parallel \
    imagemagick \
    fdupes \
    python3 \
    python3-dev \
    py3-pip \
    npm \
    shfmt \
    shellcheck \
    editorconfig-checker \
    bash-completion

ensure_citation() {
    user="${1}"
    home="${2}"
    mkdir -p "${home}/.parallel"
    touch "${home}/.parallel/will-cite"
    chown -R "${user}:${user}" "${home}/.parallel"
}

ensure_citation root /root
ensure_citation vscode /home/vscode

ensure_bash_completion() {
    filename="${1}"
    cat >>"${filename}" <<EOF

. /usr/share/bash-completion/bash_completion
EOF
}

ensure_bash_completion /root/.bashrc
ensure_bash_completion /home/vscode/.bashrc

# Python
# -----------------------------------------------------------------------------

pip3 install --no-cache-dir --upgrade pip

pip3 install --no-cache-dir pipx

USE_EMOJI=false
export USE_EMOJI

PIPX_HOME=/usr/local/pix
export PIPX_HOME

PIPX_BIN_DIR=/usr/local/bin
export PIPX_BIN_DIR

PATH="${PIPX_BIN_DIR}:${PATH}"
export PATH

pipx install doitintl-docops
pipx install proselint
pipx install yamllint

WTF_BIN="wtf"
WTF_URL="https://git.io/vqosc"

curl -fsSL "${WTF_URL}" >"${WTF_BIN}"
chmod 755 "${WTF_BIN}"
sed -i 's,#!/usr/bin/env python,#!/usr/bin/env python3,' "${WTF_BIN}"
mv "${WTF_BIN}" /usr/local/bin

# Node
# -----------------------------------------------------------------------------

npm config set fund false --global

npm install --global --no-audit npm@latest

npm install --global --no-audit --prefer-dedupe \
    cspell \
    prettier \
    lintspaces-cli \
    dockerfilelint \
    markdownlint-cli \
    markdown-link-check

# Go
# -----------------------------------------------------------------------------

# Avoid installing Go and compiling from source, which pulls in a lot of
# dependencies and takes a lot of time

MISSPELL_BIN="misspell"
MISSPELL_PKG="${MISSPELL_BIN}_0.3.4_linux_64bit"
MISSPELL_TGZ="${MISSPELL_PKG}.tar.gz"
MISSPELL_URL="https://git.io/JDvms"

curl -fsSL "${MISSPELL_URL}" >"${MISSPELL_TGZ}"
tar -xzf "${MISSPELL_TGZ}"
chown root:root "${MISSPELL_BIN}"
chmod 755 "${MISSPELL_BIN}"
mv "${MISSPELL_BIN}" /usr/local/bin

WOKE_BIN="woke"
WOKE_PKG="${WOKE_BIN}-0.17.1-linux-amd64"
WOKE_TGZ="${WOKE_PKG}.tar.gz"
WOKE_URL="https://git.io/JDvO1"

curl -fsSL "${WOKE_URL}" >"${WOKE_TGZ}"
tar -xzf "${WOKE_TGZ}"
chown root:root "${WOKE_PKG}/${WOKE_BIN}"
chmod 755 "${WOKE_PKG}/${WOKE_BIN}"
mv "${WOKE_PKG}/${WOKE_BIN}" /usr/local/bin

IMGDUP2GO_BIN="imgdup2go"
IMGDUP2GO_PKG="${IMGDUP2GO_BIN}-2.1.0_linux_amd64"
IMGDUP2GO_TGZ="${IMGDUP2GO_PKG}.tar.gz"
IMGDUP2GO_URL="https://git.io/JS7TA"

curl -fsSL "${IMGDUP2GO_URL}" >"${IMGDUP2GO_TGZ}"
tar -xzf "${IMGDUP2GO_TGZ}"
chown root:root "${IMGDUP2GO_BIN}"
chmod 755 "${IMGDUP2GO_BIN}"
mv "${IMGDUP2GO_BIN}" /usr/local/bin

# Cleanup
# -----------------------------------------------------------------------------

rm -rf /root/.cache
rm -rf /root/.config
rm -rf /root/.npm

cd /tmp
rm -rf "${tmpdir}"
