FROM alpine:latest

RUN apk add build-base \
    acl-dev acl-static attr-dev \
    lz4 lz4-dev lz4-static \
    zstd zstd-dev zstd-static \
    openssl openssl-dev openssl-libs-static \
    libxxhash xxhash xxhash-dev

WORKDIR /usr/local/src
COPY rsync-src/ /usr/local/src/

RUN ./configure CFLAGS="-static" --disable-xxhash && make && strip rsync

CMD ["./rsync", "--version"]
