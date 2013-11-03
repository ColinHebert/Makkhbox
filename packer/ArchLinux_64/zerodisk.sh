#!/bin/bash

# Requires
#   cleanup.sh

# Zero out the free space to save space in the final image
dd if=/dev/zero of=/tmp/clean bs=1M
rm -f /tmp/clean
