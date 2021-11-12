# Images to COPY from:
FROM yamlio/yaml-editor AS editor
FROM yamlio/yaml-test-runtimes-c:0.0.1 AS c
FROM yamlio/yaml-test-runtimes-go:0.0.1 AS go
FROM yamlio/yaml-test-runtimes-node:0.0.1 AS node
FROM yamlio/yaml-test-runtimes-perl:0.0.1 AS perl
FROM yamlio/yaml-test-runtimes-python:0.0.1 AS python


# Build the main image 'yaml-reference-parser':
FROM alpine:latest

# Install alpine runtime requirements:
RUN apk update \
 && apk add \
        bash \
        gmp \
        icu-libs \
        libffi \
        openjdk8-jre \
        nodejs \
        perl \
        python3 \
 && ln /usr/lib/libffi.so.7.1.0 /usr/lib/libffi.so.6 \
 && true

# Copy default assets from yaml-editor image:
COPY --from=editor \
    /bin/hsyaml-parser \
    /bin/libyaml-parser \
    /bin/yaml2yeast \
    /yaml/bin/c-libfyaml-event \
    /yaml/bin/c-libyaml-event \
    /yaml/bin/dotnet-yamldotnet-event \
    /yaml/bin/hs-hsyaml-event \
    /yaml/bin/hs-reference-yeast \
    /yaml/bin/java-snakeyaml-event \
    /yaml/bin/js-yaml-event \
    /yaml/bin/nim-nimyaml-event \
    /yaml/bin/perl-pp-event \
    /yaml/bin/py-pyyaml-event \
    /yaml/bin/py-ruamel-event \
    /usr/local/bin/

# For YamlDotNet
COPY --from=editor /usr/lib/libintl.so.8 /usr/lib

# For SnakeYAML
COPY --from=editor /java /java

# COPY in exports from runtime images:
COPY --from=c       /export/ /
COPY --from=go      /export/ /
COPY --from=node    /export/ /
COPY --from=perl    /export/ /
COPY --from=python  /export/ /

# A checker program to make sure everything works:
COPY check-testers /usr/local/bin/
