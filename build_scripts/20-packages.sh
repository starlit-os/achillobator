#!/bin/bash

set -xeuo pipefail

dnf -y remove \
	setroubleshoot

dnf -y install \
	-x gnome-extensions-app \
	system-reinstall-bootc \
	gnome-disk-utility \
	gnome-shell-extension-{appindicator,blur-my-shell} \
	just \
	tuned-ppd \
	fzf \
	glow \
	wl-clipboard \
	gum \
	buildah

# Everything that depends on external repositories should be after this.
# Make sure to set them as disabled and enable them only when you are going to use their packages.
# We do, however, leave crb and EPEL enabled by default.

dnf config-manager addrepo --from-repofile=https://pkgs.tailscale.com/stable/fedora/tailscale.repo
dnf config-manager setopt tailscale-stable.enabled=0
dnf -y --enablerepo "tailscale-stable" install \
	tailscale


dnf -y copr enable ublue-os/packages
dnf -y install \
	-x bluefin-logos \
	-x bluefin-plymouth \
	ublue-os-just \
	ublue-os-luks \
	ublue-os-signing \
	ublue-os-udev-rules \
	ublue-os-update-services \
	ublue-{motd,fastfetch,bling,rebase-helper,setup-services,polkit-rules} \
	uupd \
	bluefin-*
dnf -y copr disable ublue-os/packages

# Upstream ublue-os-signing bug, we are using /usr/etc for the container signing and bootc gets mad at this
# FIXME: remove this once https://github.com/ublue-os/packages/issues/245 is closed
cp -avf /usr/etc/. /etc
rm -rvf /usr/etc

dnf -y copr enable ublue-os/packages
dnf -y --enablerepo copr:copr.fedorainfracloud.org:ublue-os:packages swap \
	fedora-logos bluefin-logos
dnf -y install bluefin-plymouth
dnf -y copr disable ublue-os/packages

dnf -y copr enable ublue-os/staging
dnf -y install \
	gnome-shell-extension-{search-light,logo-menu,caffeine,gsconnect}
dnf -y copr disable ublue-os/staging

dnf -y copr enable che/nerd-fonts
dnf -y install \
	nerd-fonts
dnf -y copr disable che/nerd-fonts
