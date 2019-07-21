#!/bin/bash
echo "$DOCKER_PASSWORD" | docker login -u "$DOCKER_USERNAME" --password-stdin
docker push jmhossler/hossler-website
poetry run generate_kubeconfig > app.yaml
./kubectl apply -f app.yaml
