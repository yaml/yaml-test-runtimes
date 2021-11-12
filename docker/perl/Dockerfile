FROM yamlio/alpine-builder:0.0.1

RUN cpanm \
        boolean \
        YAML::PP \
 && git clone --branch=devel \
        https://github.com/yaml/yaml-reference-parser \
 && true

COPY bin/* /export/usr/local/bin/

RUN cp -r yaml-reference-parser/perl/bin/yaml-parser \
        /export/usr/local/bin/yaml-reference-parser.pl \
 && cp -r yaml-reference-parser/perl/lib/* \
          /usr/local/share/perl5/site_perl/* \
        /export/usr/local/share/perl5/site_perl/ \
 && true
