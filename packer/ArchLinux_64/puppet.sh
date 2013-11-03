#!/bin/bash

# Requires
#   aur.sh

yaourt -S --noconfirm puppet

# Don't install RDoc and RI to save time and space
cat <<EOF >> /etc/gemrc
install: --no-rdoc --no-ri
update:  --no-rdoc --no-ri
EOF

gem install hiera-gpg hiera-file
