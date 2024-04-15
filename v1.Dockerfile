# Not optimized
FROM golang:1.14

WORKDIR /build

COPY . .

RUN apt update -y
RUN apt upgrade -y

RUN go mod download

ENV CGO_ENABLED=0 GO111MODULE=on
RUN go build -a -installsuffix cgo -o /bin/app .

ENTRYPOINT ["app"]

