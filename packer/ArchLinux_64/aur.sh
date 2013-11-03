#!/bin/bash

# Requires
#   user.sh

cat <<'EOF' >> /etc/pacman.conf
[archlinuxfr]
SigLevel = Never
Server = http://repo.archlinux.fr/$arch
EOF

pacman --noconfirm -Sy yaourt base-devel

# Now Arch User Repository packages can be installed using yaourt.
