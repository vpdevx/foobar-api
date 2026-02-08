FROM golang:1.22-alpine AS builder

WORKDIR /app

COPY ./app .

RUN go mod download



RUN CGO_ENABLED=0 GOOS=linux GOARCH=amd64 go build -o foobar-api ./app.go

FROM alpine:3.20

WORKDIR /app

RUN addgroup -S app && adduser -S app -G app

COPY --from=builder /app/foobar-api /app/foobar-api

USER app

EXPOSE 8080

ENTRYPOINT ["/app/foobar-api"]
