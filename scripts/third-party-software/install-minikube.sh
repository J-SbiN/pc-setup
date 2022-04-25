#!/bin/bash

# refreshing references
sudo apt-get update -y

# installing pre-dependencies
sudo apt install curl apt-transport-https

# Download latest .deb package (there seams to be no repo)
curl -LO https://storage.googleapis.com/minikube/releases/latest/minikube_latest_amd64.deb

# installing minikube
sudo dpkg -i minikube_latest_amd64.deb

# enabling auto completion for minikube subcommands
minikube completion bash | sudo tee /etc/bash_completion.d/minikube > /dev/null

# if you wish to use an alias and extend autocompletion to that alias
# echo 'alias mik=minikube' >> ~/.bashrc
# echo 'complete -F __start_minikube mik' >> ~/.bashrc
