#!/bin/bash

# Requires
#   aur.sh

yaourt -S --noconfirm puppet
gem install hiera-gpg hiera-file
