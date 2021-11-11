# Images to COPY from:
FROM yamlio/tester-go-yaml:0.0.1 AS tester-go-yaml
FROM yamlio/tester-yaml-reference-parser:0.0.1 AS tester-yaml-reference-parser


# Build the main image 'yaml-reference-parser':
FROM yamlio/yaml-editor

RUN apk update \
 && apk add \
        build-base \
        perl-app-cpanminus \
        wget \
 && true

RUN cpanm -n \
        Capture::Tiny \
 && true

# YAML Reference Parser (Perl)
COPY --from=tester-yaml-reference-parser \
    /export/ \
    /

# go-yaml
COPY --from=tester-go-yaml \
    /export/ \
    /
