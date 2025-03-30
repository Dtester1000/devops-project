@echo off
setlocal
REM Set the repository URL
set REPO_URL="https://github.com/Dtester1000/Toy-Store-DevOps.git"

REM Set the directory name for the cloned repository
IF NOT EXIST "Toy-Store" (
    echo Cloning the repository...
    git clone %REPO_URL% Toy-Store
    echo Repository cloned.
) ELSE (
    echo Repository already cloned.
)

docker login

cd Toy-Store

kubectl apply -f mongo.yml,sonar.yml,web.yml --validate=false

endlocal