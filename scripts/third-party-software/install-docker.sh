#!/bin/bash

##  This script will install docker, docker-compose, their CLI and their dependencies.
##  Docker is a tool to manage containers.

# update references
sudo apt-get update

# installing pre-dependencies
sudo apt-get install -y ca-certificates curl gnupg lsb-release

# add docker repo key
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg

# add docker repo to references
echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/ubuntu \
  $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null

# update references
sudo apt-get update

# install docker
sudo apt-get install docker-ce docker-ce-cli containerd.io