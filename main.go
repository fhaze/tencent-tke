package main

import (
  "net/http"
  "github.com/labstack/echo/v4"
)

func main() {
  e := echo.New()

  e.GET("/", hello)

  e.Start(":8080")
}

func hello(c echo.Context) error {
  return c.String(http.StatusOK, "Hello World!!")
}
