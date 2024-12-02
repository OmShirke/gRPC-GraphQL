# Build Stage
FROM golang:1.23-alpine AS build

# Install build dependencies
RUN apk --no-cache add gcc g++ make ca-certificates

# Set the working directory inside the container
WORKDIR /go/src/github.com/OmShirke/gRPC-Microservice-Order

# Copy dependency files
COPY go.mod go.sum ./

# Download dependencies
RUN go mod download

# Copy vendor and service-specific files
COPY vendor vendor
COPY order order

# Build the Go application
RUN GO111MODULE=on go build -mod vendor -o /go/bin/app ./order/cmd/order

# Runtime Stage
FROM alpine:3.11

# Set the working directory
WORKDIR /usr/bin

# Copy the binary from the build stage
COPY --from=build /go/bin/ .

# Expose the service port
EXPOSE 8080

# Run the application
CMD ["app"]

