#!/bin/bash

sudo apt update
sudo DEBIAN_FRONTEND=noninteractive apt full-upgrade -y
sudo DEBIAN_FRONTEND=noninteractive apt install -y --no-install-recommends ca-certificates curl gpg jq lsb-release linux-image-generic sudo libibverbs-dev
sudo reboot