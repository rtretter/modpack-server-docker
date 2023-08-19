FROM openjdk:17-ea-jdk-slim as install

COPY ./serverfiles /app
WORKDIR /app

RUN java -jar $(find . -maxdepth 1 -type f -name "*.jar") --installServer
RUN chmod +x run.sh
RUN ./run.sh

FROM ubuntu:22.04 as eula

WORKDIR /app
COPY --from=install /app /app

RUN echo "eula=true" > eula.txt

FROM openjdk:17-ea-jdk-slim

WORKDIR /app
COPY --from=eula /app /tmp
CMD [ ! -f /app/server.properties ] && cp -rn /tmp/* /app;./run.sh