#!/bin/bash
source .env
read -p "Enter name for docker image ($IMAGE_NAME): " imagename
read -p "Enter port for server ($PORT): " port

if [[ $imagename == "" ]]
then
	imagename=$IMAGE_NAME
fi

if [[ $port == "" ]]
then
	port=$PORT
fi

echo IMAGE_NAME=\"$imagename\" > .env
echo PORT=$port >> .env

sed -E "s/modpack/$imagename/g" docker-compose.yml.tmp > docker-compose.yml

docker build --no-cache -t "$imagename" .
