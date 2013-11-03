#!/bin/bash

# Requires
#   user.sh

cat <<'EOF' >> /etc/pacman.d/mirrorlist
[archlinuxfr]
SigLevel = Never
Server = http://repo.archlinux.fr/$arch
EOF

pacman --noconfirm -Syy yaourt base-devel

# Now Arch User Repository packages can be installed using yaourt.
