alias d := dev
alias b := build
alias r := run

NAME := "ghcr.io/mozart409/docker-golang-http:latest"
default: clear
	just --list

dev: clear
	go run ./main.go

clear:
	clear

fmt:
	go fmt ./

build: clear
	docker build -t {{NAME}} .

dive:
	dive build -t {{NAME}} .

run: build
	docker run -it --rm -p 8080:8080/tcp {{NAME}}