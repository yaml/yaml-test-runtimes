# Version/tag ARG variables:
ARG ALPINE
ARG REFPARSE
ARG REFHS
ARG DOTNET
ARG GOYAML
ARG HSYAML
ARG LIBFYAML
ARG LIBYAML
ARG LUAYAML
ARG NIMYAML
ARG NPMYAML
ARG PPYAML
ARG PYYAML
ARG RYML
ARG RUAMEL
ARG RUSTYAML
ARG SNAKE
ARG SNAKEENG

# Images to COPY runtime files from:
FROM yamlio/yaml-test-refparse:$REFPARSE AS refparse
FROM yamlio/yaml-test-refhs:$REFHS       AS refhs
FROM yamlio/yaml-test-dotnet:$DOTNET     AS dotnet
FROM yamlio/yaml-test-goyaml:$GOYAML     AS goyaml
FROM yamlio/yaml-test-hsyaml:$HSYAML     AS hsyaml
FROM yamlio/yaml-test-libfyaml:$LIBFYAML AS libfyaml
FROM yamlio/yaml-test-libyaml:$LIBYAML   AS libyaml
FROM yamlio/yaml-test-luayaml:$LUAYAML   AS luayaml
FROM yamlio/yaml-test-nimyaml:$NIMYAML   AS nimyaml
FROM yamlio/yaml-test-npmyaml:$NPMYAML   AS npmyaml
FROM yamlio/yaml-test-ppyaml:$PPYAML     AS ppyaml
FROM yamlio/yaml-test-pyyaml:$PYYAML     AS pyyaml
FROM yamlio/yaml-test-ryml:$RYML         AS ryml
FROM yamlio/yaml-test-ruamel:$RUAMEL     AS ruamel
FROM yamlio/yaml-test-rustyaml:$RUSTYAML AS rustyaml
FROM yamlio/yaml-test-snake:$SNAKE       AS snake
FROM yamlio/yaml-test-snakeeng:$SNAKEENG AS snakeeng

# Need older libffi for Haskell runtimes:
FROM alpine:3.10                         AS alpine310
RUN apk update && apk add libffi


# Build the main image 'yaml-test-runtimes':
FROM alpine:$ALPINE

# Install alpine runtime requirements:
RUN apk update \
 && apk add \
        bash \
        gmp \
        icu-libs \
        libffi \
        libintl \
        lua \
        openjdk8-jre \
        nodejs \
        perl \
        python3 \
 && true

# Needed for old Haskell runtimes:
COPY --from=alpine310 \
        /usr/lib/libffi.so.6 \
        /usr/lib/libffi.so.6

# COPY in local bin scripts:
COPY bin/* /usr/local/bin/

# COPY in exports from runtime images:
COPY --from=refparse /export/ /
COPY --from=refhs    /export/ /
COPY --from=dotnet   /export/ /
COPY --from=goyaml   /export/ /
COPY --from=hsyaml   /export/ /
COPY --from=libfyaml /export/ /
COPY --from=libyaml  /export/ /
COPY --from=luayaml  /export/ /
COPY --from=nimyaml  /export/ /
COPY --from=npmyaml  /export/ /
COPY --from=ppyaml   /export/ /
COPY --from=pyyaml   /export/ /
COPY --from=ryml     /export/ /
COPY --from=ruamel   /export/ /
COPY --from=rustyaml /export/ /
COPY --from=snake    /export/ /
COPY --from=snakeeng /export/ /
