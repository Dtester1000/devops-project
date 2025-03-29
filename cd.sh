#!/bin/bash
set -e

docker login
cd Toy-Store
kubectl apply -f mongo.yaml,sonar.yaml,web.yaml
echo "Deployed to kubernetes cluster"