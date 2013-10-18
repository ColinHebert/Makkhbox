#!/bin/bash
set -e

if [ "$EUID" -ne '0' ] ; then
    echo 'Script must be run as root.' >&2
    exit 1
fi

#################
# Set up Puppet #
#################
if ! type puppet > /dev/null ; then

    if ! type yaourt > /dev/null; then
        echo 'Installing Yaourt.'
        echo -e '[archlinuxfr]\nSigLevel = Never\nServer = http://repo.archlinux.fr/$arch' >> /etc/pacman.conf
        pacman --noconfirm -Sy yaourt base-devel
        echo 'Yaourt installed.'
    fi

    echo 'Installing Puppet.'
    yaourt --noconfirm -S puppet
    echo 'Puppet installed'
fi

################
# Set up GnuPG #
################
if ! type gpg > /dev/null; then
    echo 'Installing GnuPG.'

    pacman --noconfirm -Sy gnupg

    # Generate a GPG key
    gpg --batch --gen-key <(cat << EOF
    %echo Generating a default key
    Key-Type: default
    Subkey-Type: default
    Name-Real: $USER@$(hostname)
    Name-Comment: Puppet key for $USER on $(hostname)
    Expire-Date: 0
    %commit
    %echo done
EOF)
fi

echo 'GPG key'
gpg --export -a
