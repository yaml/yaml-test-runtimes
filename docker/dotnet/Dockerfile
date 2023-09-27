ARG FROM
FROM $FROM
ARG REPO
ARG TAG

RUN apk add bash

ENV DOTNET_NOLOGO=1 \
    DOTNET_CLI_TELEMETRY_OPTOUT=1 \
    LIBNAME=dotnet-yamldotnet \
    HOME=/tmp/home \
    VERSION=$TAG \
    SOURCE=/v$TAG.tar.gz

RUN wget $REPO/archive/v$TAG.tar.gz

COPY src /src

RUN dotnet publish /src/event \
        --nologo \
        --output /build/bin \
        --configuration Release \
        --runtime linux-musl-x64

RUN dotnet publish /src/json \
        --nologo \
        --output /build/bin \
        --configuration Release \
        --runtime linux-musl-x64

RUN mkdir -p /export/usr/local/bin \
 && cp \
        /build/bin/dotnet-yamldotnet-event \
        /export/usr/local/bin/yaml-test-parse-dotnet \
 && true
