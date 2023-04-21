#!/bin/bash
# Ubuntu 20.04 amd64 install of nodejs
# run with
#    sudo ./install_node.sh
[[ "$EUID" -ne 0 ]] && echo "This script must be run as root e.g: sudo ./install_node.sh" && exit 1

apt update -y
apt install -y nodejs npm
node --version