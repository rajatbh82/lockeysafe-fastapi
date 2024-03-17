# lockeysafe-fastapi
This repository contains backend (fastapi) API for lockeysafe project.

Installation instructions:

Linux/Mac:
1. sudo docker login
2. sudo bash start.sh
if login fails
    1. rm ~/.docker/config.json
    2. sudo bash start.sh

Windows:
1. docker login
2. Give docker administration permission
3. Open powershell
4. bash start.sh

You will be entered in docker container.
To run server on port: 3030
uvicorn main:app --host 0.0.0.0 --port 3030 --reload