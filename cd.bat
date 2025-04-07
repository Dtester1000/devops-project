@echo off
setlocal

REM check if docker is running
tasklist /FI "IMAGENAME eq Docker Desktop.exe" | find /I "Docker Desktop.exe" >nul
if %errorlevel% neq 0 (
    echo Docker is not running. Please start Docker Desktop.
    exit /b 1
)
docker login
cd Toy-Store
cd kubeFiles

kubectl apply -f web.yml,mongo.yml,grafana.yml,jenkins.yml,prometheusKube.yml,nodeEX.yml --validate=false
echo "All clusters are updated and running"

endlocal