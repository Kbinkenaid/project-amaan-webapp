@echo off
echo Checking Docker containers...
docker ps
echo.
echo Checking if app is accessible...
curl -I http://localhost:9002 2>nul
if %errorlevel% equ 0 (
    echo SUCCESS: App is running at http://localhost:9002
) else (
    echo App not yet accessible, checking logs...
    docker-compose logs project-amaan
)