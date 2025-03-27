#bin/bash
set -e

USER_EMAIL='tttestyr@gmail.com'
USER_NAME='Dtester1000'

REPO_URL="https://github.com/Dtester1000/Toy-Store-DevOps.git"
commit_message= read -p "Enter commit message: "

cd Toy-Store

if [ -z "$(git remote -v)" ]; then
    git remote add origin "$REPO_URL"
    echo "Remote url "$REPO_URL" added."
else
    echo "Remote url already set changing it....."
    git remote set-url origin "$REPO_URL"
fi

git config --global user.email "$USER_EMAIL"
git config --global user.name "$USER_NAME"
git pull origin main
wait
git add .
wait
git commit -m "my commit"
wait
REPO_URL="https://github.com/Dtester1000/devops-project.git"
git remote set-url origin "$REPO_URL"
wait
git push origin main
echo "Pushed to remote repository"