#!/bin/bash
sudo apt update &&
sudo apt install apt-transport-https ca-certificates curl software-properties-common &&
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg &&
echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null &&
sudo apt update &&
apt-cache policy docker-ce &&
sudo apt install docker-ce &&
sudo usermod -aG docker ${USER} && 
curl -LO https://dl.k8s.io/release/v1.23.0/bin/linux/amd64/kubectl && 
sudo install -o root -g root -m 0755 kubectl /usr/local/bin/kubectl && 
chmod +x kubectl && 
mkdir -p ~/.local/bin && 
mv ./kubectl ~/.local/bin/kubectl && 
kubectl version --client && 
sudo apt install awscli
