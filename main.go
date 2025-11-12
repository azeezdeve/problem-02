package main

import (
	"fmt"
	"net/http"
)

func main() {
	http.HandleFunc("/healthz", func(w http.ResponseWriter, r *http.Request) {
		fmt.Fprintln(w, "ok")
	})
	http.HandleFunc("/livez", func(w http.ResponseWriter, r *http.Request) {
		fmt.Fprintln(w, "alive")
	})

	fmt.Println("Server starting on :8080")
	if err := http.ListenAndServe(":8081", nil); err != nil {
		panic(err)
	}
}
