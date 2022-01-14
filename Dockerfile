FROM golang:1.18 AS builder

WORKDIR /go/src/app
COPY main.go .

RUN go build -o docker-golang-http

FROM alpine:latest 
WORKDIR /app
COPY --from=builder /go/src/app ./
CMD [ "./docker-golang-http" ]