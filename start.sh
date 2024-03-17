#!/bin/bash          
project="lockeysafe-fastapi"
docker container stop $project
docker build -t $project .
docker container rm -f $project
docker run -d \
  -it \
  -p 3030:3030 \
  --cpus="2.0" \
  --dns 8.8.8.8 \
  --name $project \
  --mount type=bind,source="$(pwd)",target=/app \
  $project:latest
docker rmi -f $(docker images --filter "dangling=true" -q)
#  docker container run -itd -p 8080:3030 --name $project $project
# Enter docker " docker container exec -it lockeysafe-fastapi bash"
#  docker container exec -d $project uvicorn main:app --host 0.0.0.0 --port 3030 --reload &
docker container exec -it $project bash

# Run inside docker container to run server
# uvicorn main:app --host 0.0.0.0 --port 3030 --reload
