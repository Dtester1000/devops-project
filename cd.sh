#bin/bash
set -e

REPO_URL="https://github.com/Dtester1000/Toy-Store-DevOps.git"


docker login
cd Toy-Store

git remote set-url origin "$REPO_URL"
git pull origin main
docker build -t test3090/toy-store:0.0.1 .
docker push test3090/toy-store:0.0.1
wait
kubectl apply -f mongo.yaml,sonar.yaml,web.yaml
echo "Deployed to kubernetes cluster"