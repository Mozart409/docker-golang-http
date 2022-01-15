FROM golang:1.18beta1-alpine3.15 AS builder

WORKDIR /go/src/app
COPY main.go .
COPY go.mod .
COPY go.sum .

RUN go build -o docker-golang-http

FROM alpine:latest 
WORKDIR /app
COPY --from=builder /go/src/app ./
CMD [ "./docker-golang-http" ]