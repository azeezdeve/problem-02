# Original inefficient Dockerfile — needs improvement
FROM golang:1.20 AS builder

WORKDIR /app
COPY . .
RUN go build -o server .

FROM alpine:latest

WORKDIR /root/

# Copy only the compiled binary from the builder stage
COPY --from=builder /app/server .

EXPOSE 8080

# Run the binary
CMD ["./server"]