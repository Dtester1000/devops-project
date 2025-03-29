#!/bin/bash
set -e

commit_message= read -p "Enter commit message: "

cd Toy-Store
docker login
git pull origin main
git add .
git commit -m "$commit_message"
REPO_URL="https://github.com/Dtester1000/devops-project.git"
git remote set-url origin "$REPO_URL"

#docker build -t test3090/toy-store:0.0.1 .
#docker push test3090/toy-store:0.0.1
git push origin main
echo "All files pushed to remote repositories"