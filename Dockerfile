FROM golang:1.25-alpine3.22 AS builder

WORKDIR /app

COPY . /app

RUN go build -o dance .

FROM scratch

WORKDIR /app
COPY --from=builder /app/dance /app

EXPOSE 8080

CMD ["/app/dance"]
