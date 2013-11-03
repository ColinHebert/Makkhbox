#!/bin/bash

# Requires
#   ssh.sh
#   bootloader.sh

# https://bugs.archlinux.org/task/31250
# https://wiki.archlinux.org/index.php/Secure_Shell#SSH_connection_left_hanging_after_poweroff.2Freboot
# Since systemd reboot does not notify/close SSH client connections, packer
# never tries to reconnect to the VM post-reboot. This flaky workaround tries
# to ensure that client connections have been disconnected prior to reboot.
cp /usr/lib/systemd/system/systemd-user-sessions.service /etc/systemd/system
sed -i 's/\(After=remote-fs.target\)/\1 network.target/' /etc/systemd/system/systemd-user-sessions.service
systemctl daemon-reload
rm -f /etc/systemd/system/systemd-user-sessions.service

reboot
