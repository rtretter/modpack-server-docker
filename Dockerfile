FROM ubuntu:22.04 as install

COPY ./serverfiles /app
WORKDIR /app

# RUN java -jar $(find . -maxdepth 1 -type f -name "*.jar") --installServer
RUN apt update && apt upgrade -y && apt install wget -y
RUN chmod +x start.sh
RUN printf "I agree" | ./start.sh; exit 0
# RUN chmod +x run.sh
# RUN ./run.sh

RUN echo "eula=true" > eula.txt

RUN mv -f /app/* /tmp
CMD [ ! -f /app/server.properties ] && cp -rn /tmp/* /app;./start.sh
