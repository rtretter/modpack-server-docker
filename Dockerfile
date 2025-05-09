FROM ubuntu:22.04 as install

COPY ./serverfiles /app
WORKDIR /app

# If installation happens via a jar file
# RUN java -jar $(find . -maxdepth 1 -type f -name "*.jar") --installServer
RUN apt update && apt upgrade -y && apt install wget -y
RUN chmod +x start.sh
RUN printf "I agree" | ./start.sh; exit 0
# Call startserver, sleep 10 seconds then end it (if server automatically restarts)
# RUN ./startserver.sh & sleep 10; kill $!

# RUN chmod +x run.sh
# RUN ./run.sh

RUN echo "eula=true" > eula.txt

RUN mv -f /app/* /tmp
CMD [ ! -f /app/server.properties ] && cp -rn /tmp/* /app;./start.sh
