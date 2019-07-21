#!/bin/bash

curl -LO https://storage.googleapis.com/kubernetes-release/release/$(curl -s https://storage.googleapis.com/kubernetes-release/release/stable.txt)/bin/linux/amd64/kubectl
chmod +x ./kubectl
curl -sL https://github.com/digitalocean/doctl/releases/download/v1.22.0/doctl-1.22.0-linux-amd64.tar.gz | tar -xzv
chmod +x ./doctl
./doctl auth init
./doctl kubernetes cluster kubeconfig save test-website-cluster
