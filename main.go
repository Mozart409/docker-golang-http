package main

import (
	"fmt"
	"log"
	"net/http"
)

func handler(w http.ResponseWriter, r *http.Request) {
	fmt.Fprintf(w, "Hello from the webserver")
}

func main() {
	http.HandleFunc("/", handler)
	fmt.Println("Visit on localhost:8080")
	log.Fatal(http.ListenAndServe("localhost:8080", nil))
}
