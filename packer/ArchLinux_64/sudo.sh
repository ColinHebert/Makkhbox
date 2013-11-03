#!/bin/bash

# Requires
#   reboot.sh

sudo pacman --noconfirm -S sudo

# Sudo setup
cat <<EOF > /etc/sudoers
root ALL=(ALL) ALL
%wheel ALL=(ALL) NOPASSWD: ALL
EOF
