#! /bin/bash

# general setup
sudo yum update -y
sudo yum install -y curl jq python3

# setup docker
SCRIPT_NAME="aws-linux2-docker.sh"
curl -s "https://raw.githubusercontent.com/Gavin1937/quick-docker-setup/main/$SCRIPT_NAME" | sudo bash -s

# setup dufs
sudo docker pull sigoden/dufs
env python3 setup-config.py

# run dufs
run-dufs.sh

