FROM ubuntu:22.04
RUN apt-get update
RUN apt-get -y upgrade 
ARG DEBIAN_FRONTEND=noninteractive
ENV TZ=Asia/Kolkata
RUN apt-get install -y python3 python3-pip sqlite3
RUN ln -fs /usr/share/zoneinfo/Asia/Kolkata /etc/localtime
RUN apt-get -y install tzdata
RUN pip3 install fastapi==0.110.0 uvicorn[standard]
WORKDIR /app
EXPOSE 8000