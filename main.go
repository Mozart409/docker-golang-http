package main

import (
	"fmt"
	"log"
	"net/http"

	"github.com/gorilla/mux"
)

func IndexHandler(w http.ResponseWriter, r *http.Request) {
	fmt.Fprintf(w, "Hello from the webserver")
}

func HealthRequest(w http.ResponseWriter, r *http.Request) {
	w.WriteHeader(http.StatusOK)
	w.Header().Set("Content-Type", "application/json")
	w.Write([]byte("OK"))
}

func main() {
	r := mux.NewRouter()
	r.HandleFunc("/", IndexHandler)
	r.HandleFunc("/_healthcheck", HealthRequest)
	http.Handle("/", r)

	fmt.Println("Visit on http://localhost:8080")
	log.Fatal(http.ListenAndServe("localhost:8080", nil))
}
