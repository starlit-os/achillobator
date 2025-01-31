#!/bin/bash

set -xeuo pipefail

# This is for better testing, we might split this later

# dnf install -y fuse flatpak-builder

# # VSCode on the base image!
# rpm --import https://packages.microsoft.com/keys/microsoft.asc
# dnf config-manager addrepo --from-repofile="https://packages.microsoft.com/yumrepos/vscode/config.repo" --save-filename=vscode
# dnf -y install code
# dnf config-manager setopt vscode-yum.enabled=0

# dnf config-manager addrepo --from-repofile="https://download.docker.com/linux/fedora/docker-ce.repo"
# dnf config-manager setopt docker-ce-stable.enabled=0
# dnf -y --enablerepo docker-ce-stable install \
# 	docker-ce \
# 	docker-ce-cli \
# 	containerd.io \
# 	docker-buildx-plugin \
# 	docker-compose-plugin

# systemctl enable docker
