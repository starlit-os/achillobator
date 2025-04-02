#!/bin/bash

set -xeuo pipefail

dnf -y install headsetcontrol

# Ghostty
# TODO: Disabled until it matches the terminfo from ncurses package.
# dnf -y copr enable pgdev/ghostty
# dnf -y install ghostty
# dnf -y copr disable pgdev/ghostty
