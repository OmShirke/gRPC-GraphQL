# Use a Golang image for building the application
FROM golang:1.23-alpine AS build

# Install necessary dependencies
RUN apk --no-cache add gcc g++ make ca-certificates

# Set the working directory inside the container
WORKDIR /app

# Copy go.mod and go.sum
COPY gRPC-Graphql/go.mod gRPC-Graphql/go.sum ./

# Copy the necessary service files
COPY gRPC-Account-service/ gRPC-Account-service/
COPY gRPC-Catalog-service/ gRPC-Catalog-service/
COPY gRPC-Order-service/ gRPC-Order-service/
COPY gRPC-Graphql/ .

# Download the Go modules dependencies (optional, but useful for syncing)
RUN GO111MODULE=on go mod download

# Ensure the dependencies are in sync
RUN GO111MODULE=on go mod tidy

# Build the application binary
RUN go build -o /app/bin/graphql .

# Final stage: create a smaller image to run the application
FROM alpine:3.11

# Set the working directory inside the container
WORKDIR /usr/bin

# Copy the compiled binary from the build stage
COPY --from=build /app/bin/graphql .

# Expose the port your application runs on
EXPOSE 8080

# Command to run the application
CMD ["./graphql"]
