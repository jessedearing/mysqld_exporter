ARG ARCH="amd64"
ARG OS="linux"
FROM quay.io/prometheus/busybox-${OS}-${ARCH}:latest
LABEL maintainer="Jesse Dearing <oss@me.jesse.dev>"

ARG ARCH="amd64"
ARG OS="linux"
COPY .build/${OS}-${ARCH}/mysqld_exporter /bin/mysqld_exporter

EXPOSE      9104
USER        65534
ENTRYPOINT  [ "/bin/mysqld_exporter" ]
