#!/usr/bin/env bash

set -xeuo pipefail

tee -a /etc/ublue-os/system-flatpaks.list <<EOF
dev.zed.Zed
com.axosoft.GitKraken
EOF
