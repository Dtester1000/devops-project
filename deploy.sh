#!/bin/bash
set -e


REPO_URL="https://github.com/Dtester1000/Toy-Store-DevOps.git"
# Check if Docker is installed
if ! command -v docker &> /dev/null; then
    echo "Docker is not installed. Please install Docker and try again."
    exit 1
fi
# Check if kubectl is installed
if ! command -v kubectl &> /dev/null; then
    echo "kubectl is not installed. Please install kubectl and try again."
    exit 1
fi
# Check if Docker is running
if ! docker info &> /dev/null; then
    echo "Docker is not running. Please start Docker and try again."
    exit 1
fi
# Check if kubectl is configured
if ! kubectl cluster-info &> /dev/null; then
    echo "kubectl is not configured. Please configure kubectl and try again."
    exit 1
fi

# Clone the repository

if [ ! -d Toy-Store ]; then
    echo "Cloning the repository..."
    git clone "$REPO_URL" Toy-Store
    echo "Repository cloned."
else
    echo "Repository already cloned."
fi

docker login

cd Toy-Store
cd kubeFiles

kubectl apply -f web.yml,mongo.yml,grafana.yml,jenkins.yml,prometheusKube.yml,nodeEX.yml --validate=false

