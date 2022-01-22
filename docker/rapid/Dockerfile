ARG FROM
FROM $FROM
ARG REPO
ARG TAG

RUN apk add \
        cmake \
        linux-headers \
 && true

WORKDIR /build

RUN git init --quiet \
 && git remote add origin $REPO \
 && git fetch origin $TAG \
 && git reset --hard FETCH_HEAD \
 && true

RUN git submodule add https://github.com/biojppm/c4fs ext/c4fs \
 && git submodule update --init --recursive \
 && true

COPY patch /patch

RUN patch -p1 < /patch

RUN cmake \
        -S . \
        -B build \
        -DBUILD_SHARED_LIBS=OFF \
        -DRYML_BUILD_TOOLS=ON \
 && true

RUN cmake \
        --build build \
        -j \
        --target ryml-yaml-events \
 && true

RUN cp -fav \
        "$(find build -name 'ryml-yaml-events*' -type f)" \
        /export/usr/local/bin/ryml-yaml-events \
 && true

COPY bin/yaml-test-parse-rapid \
        /export/usr/local/bin/
