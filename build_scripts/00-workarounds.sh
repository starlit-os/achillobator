#!/bin/bash

set -xeuo pipefail

# This is a bucket list. We want to not have anything in this file at all.

# See https://github.com/ublue-os/bluefin-lts/issues/3
mkdir -p /var/roothome
chmod 0700 /var/roothome
