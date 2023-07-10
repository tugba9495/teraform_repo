#!/bin/bash



sudo apt update -y
sudo apt install -y yum-utils shadow-utils
sudo apt-config-manager --add-repo https://rpm.releases.hashicorp.com/AmazonLinux/hashicorp.repo
sudo apt -y install terraform











