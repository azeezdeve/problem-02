# Original inefficient Dockerfile — needs improvement
FROM golang:1.20 AS builder

WORKDIR /app
COPY main.go .
RUN go build -o server main.go

FROM alpine:latest

WORKDIR /root/

# Copy only the compiled binary from the builder stage
COPY --from=builder /app/server .

EXPOSE 8080

# Run the binary
CMD ["./server"]