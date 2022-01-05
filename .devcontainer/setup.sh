#!/bin/sh -e

apk update
apk upgrade

apk add --no-cache \
    shfmt
