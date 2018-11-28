FROM python:3

LABEL maintainer="perillaroc@gmail.com"

RUN set -ex \
    && apt update \
    && apt install unzip

COPY sms-client.zip /srv/

RUN set -ex \
    && cd /srv \
    && unzip sms-client.zip \
    && cd sms-client \
    && make linux \
    && cp -r ./bin /srv \
    && cd /srv \
    && rm -rf sms-clinet.zip sms-client

WORKDIR /srv/bin

ENTRYPOINT ["bash"]
