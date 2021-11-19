# Version/tag ARG variables:
ARG DOTNET
ARG GOYAML
ARG HSREF
ARG HSYAML
ARG LIBFYAML
ARG LIBYAML
ARG NIMYAML
ARG NPMYAML
ARG PYYAML
ARG RUAMEL
ARG SNAKE
ARG YAMLPP
ARG YAMLREF

# Images to COPY from:
FROM yamlio/yaml-test-dotnet:$DOTNET     AS dotnet
FROM yamlio/yaml-test-goyaml:$GOYAML     AS goyaml
FROM yamlio/yaml-test-hsref:$HSREF       AS hsref
FROM yamlio/yaml-test-hsyaml:$HSYAML     AS hsyaml
FROM yamlio/yaml-test-libfyaml:$LIBFYAML AS libfyaml
FROM yamlio/yaml-test-libyaml:$LIBYAML   AS libyaml
FROM yamlio/yaml-test-nimyaml:$NIMYAML   AS nimyaml
FROM yamlio/yaml-test-npmyaml:$NPMYAML   AS npmyaml
FROM yamlio/yaml-test-pyyaml:$PYYAML     AS pyyaml
FROM yamlio/yaml-test-ruamel:$RUAMEL     AS ruamel
FROM yamlio/yaml-test-snake:$SNAKE       AS snake
FROM yamlio/yaml-test-yamlpp:$YAMLPP     AS yamlpp
FROM yamlio/yaml-test-yamlref:$YAMLREF   AS yamlref


# Build the main image 'yaml-test-runtimes':
FROM alpine:3.14

# Install alpine runtime requirements:
RUN apk update \
 && apk add \
        bash \
        gmp \
        icu-libs \
        libffi \
        libintl \
        openjdk8-jre \
        nodejs \
        perl \
        python3 \
 && ln /usr/lib/libffi.so.7.1.0 /usr/lib/libffi.so.6 \
 && true

# COPY in local bin scripts:
COPY bin/* /usr/local/bin/

# COPY in exports from runtime images:
COPY --from=dotnet    /export/ /
COPY --from=goyaml    /export/ /
COPY --from=hsref     /export/ /
COPY --from=hsyaml    /export/ /
COPY --from=libfyaml  /export/ /
COPY --from=libyaml   /export/ /
COPY --from=nimyaml   /export/ /
COPY --from=npmyaml   /export/ /
COPY --from=pyyaml    /export/ /
COPY --from=ruamel    /export/ /
COPY --from=snake     /export/ /
COPY --from=yamlpp    /export/ /
COPY --from=yamlref   /export/ /
