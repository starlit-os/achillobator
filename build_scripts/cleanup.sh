#!/usr/bin/env bash

set -xeuo pipefail

# Image cleanup
# Specifically called by build.sh

# Hide Desktop Files. Hidden removes mime associations
#sed -i 's@\[Desktop Entry\]@\[Desktop Entry\]\nHidden=true@g' /usr/share/applications/fish.desktop

# The compose repos we used during the build are point in time repos that are
# not updated, so we don't want to leave them enabled.
#dnf config-manager --set-disabled baseos-compose,appstream-compose

# Remove Bluefin overrides
rm /usr/share/glib-2.0/schemas/zz0-bluefin-modifications.gschema.override


# Image-layer cleanup
shopt -s extglob

dnf clean all

rm -rf /.gitkeep /var /boot
mkdir -p /boot /var

# Make /usr/local writeable
mv /usr/local /var/usrlocal
ln -s /var/usrlocal /usr/local

# Set file to globally readable
# FIXME: This should not be necessary, needs to be cleaned up somewhere else
chmod 644 "/usr/share/ublue-os/image-info.json"

# FIXME: use --fix option once https://github.com/containers/bootc/pull/1152 is merged
bootc container lint --fatal-warnings || true
