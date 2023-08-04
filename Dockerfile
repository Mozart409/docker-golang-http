FROM golang:1.20 AS builder

WORKDIR /go/src/app
COPY main.go .
COPY go.mod .
COPY go.sum .
RUN go mod download
RUN  GO111MODULE="on" CGO_ENABLED=0 GOOS=linux go build -o server

FROM alpine:latest 
LABEL maintainer="Mozart409"
WORKDIR /app
COPY --from=builder /go/src/app/server .
EXPOSE 8080
CMD [ "./server" ]