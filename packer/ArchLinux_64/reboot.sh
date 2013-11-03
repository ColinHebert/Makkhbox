#!/bin/bash

# Requires
#   ssh.sh
#   bootloader.sh

if [ -d /mnt/root ]; then
  # Since /mnt/root exists, we must be inside a chroot. Copy over scripts so
  # they're available post-reboot.
  cp -r /root/{*,.v*} /mnt/root
fi

reboot
