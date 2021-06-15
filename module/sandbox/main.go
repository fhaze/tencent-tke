package main

import (
	"github.com/labstack/echo/v4"
	"io"
	"net/http"
)

func main() {
	e := echo.New()

	e.GET("/", hello)
	e.GET("/phrase", phrase)

	e.Start(":8080")
}

func hello(c echo.Context) error {
	return c.String(http.StatusOK, "Sandbox V1\n")
}

func phrase(c echo.Context) error {
	resp, err := http.Get("http://phrase-generator:9090/")
	if err != nil {
		return err
	}
	defer resp.Body.Close()
	body, err := io.ReadAll(resp.Body)
	return c.String(http.StatusOK, string(body))
}
