@echo off
setlocal

docker login
cd Toy-Store
kubectl apply -f mongo.yml,sonar.yml,web.yml
echo "All clusters are updated and running"

endlocal