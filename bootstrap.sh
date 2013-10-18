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
