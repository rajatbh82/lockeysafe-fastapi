#!/bin/bash          
project="lockeysafe-fastapi"
sudo docker login
sudo docker container stop $project
sudo docker build -t $project .
sudo docker container rm -f $project
sudo docker run -d \
  -it \
  -p 3030:3030 \
  --cpus="2.0" \
  --dns 8.8.8.8 \
  --name $project \
  --mount type=bind,source="$(pwd)",target=/app \
  $project:latest
# sudo docker container run -itd -p 8080:3030 --name $project $project
sudo docker container exec -d $project uvicorn main:app --host 0.0.0.0 --port 3030 --reload &
sudo docker rmi -f $(sudo docker images --filter "dangling=true" -q)
