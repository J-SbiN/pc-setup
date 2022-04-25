#!/bin/bash

##  This script will install kubectl and its dependencies.
##  kubectl is a CLI tool to manage a kubernetes cluster.
##  Notice that this doesn't install a kubernetes server/service.

# update references
sudo apt-get update

# installing dependencies
sudo apt-get install -y apt-transport-https ca-certificates curl

# add the Google Cloud public signing key
sudo curl -fsSLo /usr/share/keyrings/kubernetes-archive-keyring.gpg https://packages.cloud.google.com/apt/doc/apt-key.gpg

# add the repository to references
echo "deb [signed-by=/usr/share/keyrings/kubernetes-archive-keyring.gpg] https://apt.kubernetes.io/ kubernetes-xenial main" | sudo tee /etc/apt/sources.list.d/kubernetes.list

# update references
sudo apt-get update

# install kubectl
sudo apt-get install -y kubectl

