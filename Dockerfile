#adoptopenjdk/openjdk11:x86_64-alpine-jre-11.0.10_9

FROM        adoptopenjdk/openjdk11:x86_64-alpine-jre-11.0.10_9
LABEL       author="YuyuLuna" maintainer="admin@mail.yuyucloud.com"


 
 RUN apt update && \
    apt install -y --no-install-recommends bash && \
    rm -rf /var/lib/{apt,dpkg,cache,log}/ && \
    adduser -D -h /home/container container



RUN echo "Asia/Taipei" > /etc/timezone;dpkg-reconfigure -f noninteractive tzdata

USER container
ENV  USER=container HOME=/home/container
ENV TZ Asia/Taipei

USER        container
ENV         USER=container HOME=/home/container

WORKDIR     /home/container

COPY        ./entrypoint.sh /entrypoint.sh

CMD         ["/bin/bash", "/entrypoint.sh"]
© 2021 GitHub, Inc.
