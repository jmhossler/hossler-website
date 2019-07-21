#!/bin/bash

curl -sL https://github.com/digitalocean/doctl/releases/download/v1.22.0/doctl-1.22.0-linux-amd64.tar.gz | tar -xzv
chmod +x ./doctl
./doctl auth init
./doctl kubernetes cluster kubeconfig save test-website-cluster

curl -LO https://storage.googleapis.com/kubernetes-release/release/v1.14.4/bin/linux/amd64/kubectl
chmod +x ./kubectl

echo "$DOCKER_PASSWORD" | docker login -u "$DOCKER_USERNAME" --password-stdin
docker push jmhossler/hossler-website
poetry install && poetry run generate_kubeconfig > app.yaml
./kubectl apply -f app.yaml
