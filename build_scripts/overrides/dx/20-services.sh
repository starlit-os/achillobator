#!/usr/bin/env bash

set -xeuo pipefail

systemctl enable incus.socket
systemctl enable incus.service
systemctl enable incus-startup
