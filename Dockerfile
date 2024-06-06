FROM golang:1.22 as builder
COPY . /go/src/github.com/prometheus/mysqld_exporter
WORKDIR /go/src/github.com/prometheus/mysqld_exporter
ENV GOOS=linux GOARCH=amd64
RUN make build

FROM quay.io/prometheus/busybox-linux-amd64:latest
LABEL maintainer="Jesse Dearing <oss@me.jesse.dev>"

ARG ARCH="amd64"
ARG OS="linux"
COPY --from=builder /go/src/github.com/prometheus/mysqld_exporter/mysqld_exporter /bin/mysqld_exporter

EXPOSE      9104
USER        65534
ENTRYPOINT  [ "/bin/mysqld_exporter" ]
