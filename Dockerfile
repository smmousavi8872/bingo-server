# Build stage
FROM golang:1.22-alpine AS builder
WORKDIR /app
COPY go.mod ./
RUN go mod download
COPY . .
RUN CGO_ENABLED=0 GOOS=linux GOARCH=amd64 go build -o cards-api

# Runtime stage (tiny, secure)
FROM gcr.io/distroless/base-debian12
WORKDIR /app
COPY --from=builder /app/cards-api /app/cards-api
COPY --from=builder /app/cards.json /app/cards.json
EXPOSE 8000
ENV PORT=8000
USER 65532:65532
ENTRYPOINT ["/app/cards-api"]