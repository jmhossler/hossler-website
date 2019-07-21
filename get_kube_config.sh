#!/bin/bash

curl -sL https://github.com/digitalocean/doctl/releases/download/v<version>/doctl-<version>-linux-amd64.tar.gz | tar -xzv
doctl auth init
doctl kubernetes cluster kubeconfig save test-website-cluster
