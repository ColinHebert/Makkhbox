#!/bin/bash

# Partition disk
fdisk /dev/sda << EOF
n
p
1


w
y
EOF

# Format the partition
mkfs.ext4 /dev/sda1

# Install the base system
mount /dev/sda1 /mnt
# Get reflector so we can update the mirrorlist
pacstrap /mnt base reflector
genfstab -U /mnt >> /mnt/etc/fstab

# Chroot into the new system
arch-chroot /mnt <<ENDCHROOT
# Enable DHCP
systemctl enable dhcpcd

# Set root password
passwd<<EOF
packer
packer
EOF
ENDCHROOT
