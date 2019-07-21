#!/bin/bash

# Publish docker stuff
echo "$DOCKER_PASSWORD" | docker login -u "$DOCKER_USERNAME" --password-stdin
docker push jmhossler/hossler-website

# Download kubectl and doctl
curl -LO https://storage.googleapis.com/kubernetes-release/release/v1.15.1/bin/linux/amd64/kubectl
chmod +x ./kubectl
sudo mv ./kubectl /usr/local/bin/kubectl

curl -sL https://github.com/digitalocean/doctl/releases/download/v1.22.0/doctl-1.22.0-linux-amd64.tar.gz | tar -xzv
chmod +x ./doctl
sudo mv ./doctl /usr/local/bin/doctl

# Grab kubeconfig
doctl auth init
doctl kubernetes cluster kubeconfig save test-website-cluster

# Generate kubernetes app.yaml file
poetry install && poetry run generate_kubeconfig > app.yaml
cat app.yaml

# Deploy application
kubectl apply -f app.yaml
