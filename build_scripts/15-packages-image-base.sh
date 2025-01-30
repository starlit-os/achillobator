#!/usr/bin/env bash

set -euox pipefail

# This is the base for a minimal GNOME system on Fedora.

# Multimidia codecs
dnf -y install @multimedia gstreamer1-plugins-{bad-free,bad-free-libs,good,base} lame{,-libs} libjxl

# `dnf group info Workstation` without GNOME
dnf group install -y --nobest \
  -x rsyslog* \
  -x cockpit \
  -x cronie* \
  -x crontabs \
  -x PackageKit \
  -x PackageKit-command-not-found \
  networkmanager-submodules \
  core \
  fonts \
  guest-desktop-agents \
  hardware-support \
  standard \
  workstation-product

# Minimal GNOME group. ("Multimedia" adds most of the packages from the GNOME group. This should clear those up too.)
# In order to reproduce this, get the packages with `dnf group info GNOME`, install them manually with dnf install and see all the packages that are already installed.
# Other than that, I've removed a few packages we didnt want, those being a few GUI applications.
dnf -y install \
  -x PackageKit \
  -x PackageKit-command-not-found \
  -x gnome-software-fedora-langpacks \
   gdm \
   gnome-bluetooth \
   gnome-color-manager \
   gnome-control-center \
   gnome-initial-setup \
   gnome-remote-desktop \
   gnome-session-wayland-session \
   gnome-settings-daemon \
   gnome-shell \
   gnome-software \
   gnome-user-docs \
   gvfs-fuse \
   gvfs-goa \
   gvfs-gphoto2 \
   gvfs-mtp \
   gvfs-smb \
   libsane-hpaio \
   nautilus \
   orca \
   ptyxis \
   sane-backends-drivers-scanners \
   xdg-desktop-portal-gnome \
   xdg-user-dirs-gtk \
   yelp-tools

dnf -y install \
	plymouth \
	plymouth-system-theme \
	fwupd

# This package adds "[systemd] Failed Units: *" to the bashrc startup
dnf -y remove console-login-helper-messages
