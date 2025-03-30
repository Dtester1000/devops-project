#!/bin/bash
set -e


REPO_URL="https://github.com/Dtester1000/Toy-Store-DevOps.git"

# Initialize a new git repository if not already initialized
if [ ! -d .git ]; then
    echo "Initializing git repository..."
    git init
    echo "Git repository initialized."
else
    echo "Git repository already initialized."
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

kubectl apply -f web.yml,mongo.yml,sonar.yml
