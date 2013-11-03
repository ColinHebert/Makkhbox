#!/bin/bash

# Requires
#   reboot.sh

pacman --noconfirm -S sudo

# Sudo setup
cat <<EOF > /etc/sudoers
root ALL=(ALL) ALL
%wheel ALL=(ALL) NOPASSWD: ALL
EOF
