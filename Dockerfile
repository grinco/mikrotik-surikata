ARG BUILD_FROM="ubuntu:24.04"
FROM ${BUILD_FROM}

WORKDIR /tmp

RUN apt-get update && apt-get install -y python3 wget unzip python3-pip

# install dependencies
RUN apt-get install -y python3-pyinotify python3-ujson python3-librouteros python3-requests
COPY mikrocata.py /

VOLUME /var/log/suricata
ENV ROUTER_IP="192.168.1.1"
ENV ROUTER_PORT="8729"
ENV USERNAME="admin"
ENV PASSWORD=""
ENV ADDRESS_LIST="ids_blocked"
ENV TTL="12h"
ENV ENABLE_TELEGRAM=False
ENV TOKEN=""
ENV CHATID=""

CMD [ "/usr/bin/python3", "/mikrocata.py" ]

