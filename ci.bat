@echo off
setlocal

set /p commit_message="Enter commit message: "    

cd Toy-Store
docker login
git pull origin main
git add .
REM git rm --cached Toy-Store -f
git commit -m "%commit_message%"
git push origin main
echo "All files pushed to remote repositories"


endlocal