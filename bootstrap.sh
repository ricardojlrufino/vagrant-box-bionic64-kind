#!/bin/bash
export DEBIAN_FRONTEND=noninteractive

# Install docker
echo "**** installing docker"
sudo apt-get install -y ca-certificates software-properties-common curl wget dnsutils nano
##  apt-transport-https gnupg-agent
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"
sudo apt-get update
sudo apt-get install -y docker-ce docker-ce-cli containerd.io 
usermod -aG docker vagrant
#sudo docker run hello-world
echo "**** End installing Docker CE"

echo "**** Installing kubectl"
curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl"
chmod +x ./kubectl
mv ./kubectl /usr/local/bin/kubectl
kubectl version
echo "**** End installing kubectl"

echo "**** Installing kind"
curl -Lo ./kind https://kind.sigs.k8s.io/dl/v0.22.0/kind-linux-amd64
chmod +x ./kind
mv ./kind /usr/local/bin/kind
kind version
echo "**** End installing kind"
