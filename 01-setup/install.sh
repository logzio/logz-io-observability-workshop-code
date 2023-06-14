#!/bin/sh

# upgrade aws otherwise we will not be able to talk to our eks cluster
pip3 install awscli --upgrade --user
echo 'export PATH=~/.local/bin:$PATH' >>~/.bashrc
source ~/.bashrc

curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl"
sudo mv kubectl /usr/local/bin/
sudo chmod +x /usr/local/bin/kubectl

curl https://raw.githubusercontent.com/helm/helm/main/scripts/get-helm-3 | bash

curl -sSL https://github.com/roboll/helmfile/releases/latest/download/helmfile_$(uname -s | tr '[:upper:]' '[:lower:]')_amd64 -o helmfile
chmod +x helmfile
sudo mv helmfile /usr/local/bin/

curl --silent --location "https://github.com/weaveworks/eksctl/releases/latest/download/eksctl_$(uname -s)_amd64.tar.gz" | tar xz -C /tmp
sudo mv /tmp/eksctl /usr/local/bin

echo "To finalize the setup source the bashrc file you can do that by executing the following command."
echo "source ~/.bashrc"
