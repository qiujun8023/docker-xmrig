FROM alpine:latest as builder

ARG VERSION="6.11.0"

ENV DOWNLOAD_URL=https://github.com/xmrig/xmrig/releases/download/v${VERSION}/xmrig-${VERSION}-linux-static-x64.tar.gz
ENV FILE_NAME=xmrig-v${VERSION}.tar.gz

RUN set -ex && \
    wget --no-check-certificate -q ${DOWNLOAD_URL} -O ${FILE_NAME} && \
    tar zxvf ${FILE_NAME} && \
    rm ${FILE_NAME} && \
    mv xmrig-${VERSION} /opt/xmrig

ENTRYPOINT ["/opt/xmrig/xmrig"]
CMD ["--config=/opt/xmrig/config.json"]