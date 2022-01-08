ARG FROM
FROM $FROM
ARG REPO
ARG TAG

RUN apk add cargo

WORKDIR /not-used-yet

RUN git init --quiet \
 && git remote add origin $REPO \
 && git fetch origin $TAG \
 && git reset --hard FETCH_HEAD \
 && true

WORKDIR /yaml-rust-test

COPY Cargo.* ./
COPY src ./src

RUN cargo build

RUN cp target/debug/yaml-rust-test \
        /export/usr/local/bin/yaml-test-parse-rustyaml
