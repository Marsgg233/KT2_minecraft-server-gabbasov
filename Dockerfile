FROM eclipse-temurin:21-jdk-alpine
LABEL maintainer="ГАББАСОВ"
WORKDIR /minecraft
ENV MC_RAM=1024M
RUN apk add --no-cache wget curl && \
    wget https://api.papermc.io/v2/projects/paper/versions/1.20.4/builds/418/downloads/paper-1.20.4-418.jar -O server.jar && \
    echo "eula=true" > eula.txt
RUN echo "server-port=25565" > server.properties && \
    echo "online-mode=false" >> server.properties && \
    echo "max-players=20" >> server.properties && \
    echo "motd=Привет от ГАББАСОВА! Сервер на Paper" >> server.properties
EXPOSE 25565
CMD ["sh", "-c", "java -Xmx${MC_RAM} -Xms${MC_RAM} -jar server.jar nogui"]
