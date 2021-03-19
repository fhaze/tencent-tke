package main

import (
	"math/rand"
	"net/http"

	"github.com/labstack/echo/v4"
)

type Hello struct {
	Phrase string `json:"phrase"`
}

var phrases []string = []string{
	"Hello World!",
	"こんにちは世界！",
	"世界你好！",
	"Olá Mundo!",
}

func main() {
	e := echo.New()

	e.GET("/", hello)
	e.GET("/json", helloJson)

	e.Start(":9090")
}

func hello(c echo.Context) error {
	i := rand.Intn(len(phrases))
	return c.String(http.StatusOK, phrases[i])
}

func helloJson(c echo.Context) error {
	i := rand.Intn(len(phrases))
	return c.JSON(http.StatusOK, Hello{Phrase: phrases[i]})
}
