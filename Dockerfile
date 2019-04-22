# ----------------------------------
# Pterodactyl Core Dockerfile
# Environment: Java Open J9 (glibc support)
# Minimum Panel Version: 0.6.0
# ----------------------------------

FROM        adoptopenjdk/openjdk8-openj9:slim

LABEL       author="Dragos" maintainer="dragos@gamster.org"

RUN apt-get update -y \
 && apt-get install -y curl ca-certificates openssl git tar sqlite fontconfig iproute2 \
 && useradd -d /home/container -m container

USER        container
ENV         USER=container HOME=/home/container

WORKDIR     /home/container

COPY        ./entrypoint.sh /entrypoint.sh

CMD         ["/bin/bash", "/entrypoint.sh"]
