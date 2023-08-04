# Golang Simple Webserver

Testing docker multistage builds with alpine and scratch

## Dependencies

- [Docker](https://www.docker.com/)
- [Golang](https://golang.org/)
- [Just](https://github.com/casey/just)
- [Mux](https://github.com/gorilla/mux)

## Optional Dependencies

- [Dive](https://github.com/wagoodman/dive)

## Build

```bash
# Lists all available commands
just
```

```bash
# Build the docker image
just b
```

## Run

```bash
# Run the docker image
just run
```

## Image size

- with alpine: 14mb
