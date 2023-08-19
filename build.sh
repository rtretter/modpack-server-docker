read -p "Enter name for docker image: " imagename
read -p "Enter port for server: " port
echo IMAGE_NAME=\"$imagename\" > .env
echo PORT=$port >> .env
docker build -t "$imagename" .