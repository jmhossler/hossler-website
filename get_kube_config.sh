#!/bin/bash

curl -sL https://github.com/digitalocean/doctl/releases/download/v1.22.0/doctl-1.22.0-linux-amd64.tar.gz | tar -xzv
./doctl auth init
./doctl kubernetes cluster kubeconfig save test-website-cluster
