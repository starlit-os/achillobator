#!/bin/bash

set -xeuo pipefail

dnf install -y \
	python3-ramalama

# Incus
dnf -y copr enable ganto/lxc4
dnf -y copr enable ganto/umoci
dnf -y install \
    genisoimage \
    incus{,-agent,-client}\
    umoci \
    swtpm
dnf -y copr disable ganto/lxc4
dnf -y copr disable ganto/umoci

groupmod -g 251 incus
groupmod -g 252 incus-admin
