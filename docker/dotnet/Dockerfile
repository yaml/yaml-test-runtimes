FROM mcr.microsoft.com/dotnet/core/sdk:3.1-alpine

ARG REPO
ARG TAG

RUN apk add bash

ENV DOTNET_NOLOGO=1 \
    DOTNET_CLI_TELEMETRY_OPTOUT=1 \
    LIBNAME=dotnet-yamldotnet \
    HOME=/tmp/home \
    VERSION=11.2.1 \
    SOURCE=/v11.2.1.tar.gz

RUN wget https://github.com/aaubry/YamlDotNet/archive/v11.2.1.tar.gz

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
