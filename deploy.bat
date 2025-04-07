@echo off
setlocal
REM Set the repository URL
set REPO_URL="https://github.com/Dtester1000/Toy-Store-DevOps.git"

REM Check if Docker is installed
IF NOT EXIST "C:\Program Files\Docker\Docker\Docker Desktop.exe" (
    echo Docker is not installed. Please install Docker Desktop.
    exit /b 1
)
REM Check if kubectl is installed


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
cd kubeFiles

kubectl apply -f web.yml,mongo.yml,grafana.yml,jenkins.yml,prometheusKube.yml,nodeEX.yml --validate=false

endlocal