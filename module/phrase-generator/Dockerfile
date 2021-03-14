FROM golang:latest as builder
WORKDIR /build
COPY . /build
RUN go mod download
RUN CGO_ENABLED=0 GOOS=linux GOARCH=amd64 go build -o phrase

FROM alpine:latest
WORKDIR /app
COPY --from=builder /build/phrase .
EXPOSE 9090
CMD ["/app/phrase"]
