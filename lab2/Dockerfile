FROM ubuntu:24.04

#set working directory
WORKDIR /usr/src/app

#install curl
RUN apt-get update
RUN apt-get install -y curl

#copy script to container

COPY script.sh .

#make script excutable 
RUN chmod +x script.sh

#run script
CMD ["./script.sh"]

