#!/bin/bash
set -e

# Check if Docker is running
if ! docker info &> /dev/null; then
    echo "Docker is not running. Please start Docker and try again."
    exit 1
fi

docker login
cd Toy-Store
cd kubeFiles

kubectl apply -f web.yml,mongo.yml,grafana.yml,jenkins.yml,prometheusKube.yml,nodeEX.yml --validate=false 
echo "All clusters are updated and running"