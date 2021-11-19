FROM yamlio/yaml-test-alpine:0.0.1

ARG TAG

RUN cpanm -n \
        boolean \
        YAML::PP@$TAG \
 && true

RUN cp -Pr \
        /usr/local/share/perl5/site_perl/* \
        /export/usr/local/share/perl5/site_perl/ \
 && true
