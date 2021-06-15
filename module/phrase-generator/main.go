package main

import (
	"github.com/labstack/echo/v4"
	"math/rand"
	"net/http"
)

var phrases []string = []string{
	"Hello World!",
	"こんにちは世界！",
	"世界你好！",
	"Olá Mundo!",
}

func main() {
	e := echo.New()

	e.GET("/", hello)

	e.Start(":9090")
}

func hello(c echo.Context) error {
	i := rand.Intn(len(phrases))
	return c.String(http.StatusOK, phrases[i])
}
