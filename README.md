# modpack-server-docker
Dockerfile for building image and docker-compose for running a modpack-server.

## Usage
1. Paste server file into the ```serverfiles``` directory.
2. Modify the Dockerfile to complete installation instructions for the modpack (sometimes a little trial and error)
2. Run the ```build.sh``` file to enter a name for the image/container and set the port for the modpack server.
3. Run ```docker-compose up -d```
