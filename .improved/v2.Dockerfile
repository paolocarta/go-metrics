
FROM golang:1.14.15-alpine3.13 AS gobuilder

## command to be executed to build:
##
# docker build -t go-metrics:v1 .

WORKDIR /go/src/github.com/paolocarta/go-metrics

COPY go.mod go.mod
RUN go mod download

COPY . .

ENV GO111MODULE=on
ENV CGO_ENABLED=0
ENV GOOS=linux
ENV GOARCH=amd64

RUN go build -a -installsuffix cgo -o /bin/app .

# ---

FROM alpine:3.14.0

RUN apk update --no-cache
RUN apk add --no-cache bash
RUN apk add --no-cache curl

WORKDIR /usr/bin/
# COPY --from=gobuilder --chown=1001 /bin/app .
COPY --from=gobuilder /bin/app .

EXPOSE 8080
EXPOSE 9090
EXPOSE 9091

USER 1001

ENTRYPOINT "/usr/bin/app"
