# gRPC-GraphQL

<h2>Overview</h2>
The gRPC-GraphQL service is a standalone microservice designed to provide a GraphQL interface to interact with other microservices in a distributed system. It integrates gRPC for communication with backend services, enabling efficient data fetching via GraphQL queries.

<h2>Features</h2>
1. Implements GraphQL server to interact with other microservices.<br>
2. Uses gRPC for efficient communication with backend services.<br>
3. Supports both query and mutation resolvers for CRUD operations.<br>
4. Uses gqlgen for GraphQL schema generation.<br>

# Project Structure
<code>account_resolver.go</code>: Resolver for account-related GraphQL queries.<br>
<code>app.dockerfile</code>: Dockerfile to build and deploy the microservice.<br>
<code>generated.go</code>: Generated GraphQL types and resolvers.<br>
<code>go.mod</code>: Go module definition.<br>
<code>go.sum</code>: Go module checksum file.<br>
<code>gqlgen.yml</code>: gqlgen configuration file.<br>
<code>graph.go</code>: GraphQL query and mutation definitions.<br>
<code>main.go</code>: Main entry point for the GraphQL server.<br>
<code>models.go</code>: GraphQL server data models.<br>
<code>models_gen.go</code>: Generated GraphQL data models.<br>
<code>mutation_resolve.go</code>: Resolver for handling GraphQL mutations.<br>
<code>query_resolver.go</code>: Resolver for handling GraphQL queries.<br>
<code>schema.graphql</code>: GraphQL schema file defining types and operations.<br>

# Installation and Setup

<h2>Prerequisites</h2>
Go (version 1.20+ recommended)<br>
Docker and Docker Compose<br>
gqlgen (for GraphQL schema generation)<br>

<h2>Clone this repo:</h2>
<code>git clone https://github.com/OmShirke/gRPC-GraphQL.git</code><br>
<code>cd gRPC-GraphQL</code><br>

<h2>Build the Docker image:</h2>
<code>docker build -t grpc-graphql-service -f app.dockerfile .</code><br>

<h2>Start the services:</h2>
<code>docker-compose up</code><br>

<h2>Generate GraphQL schema and resolvers:</h2>
<code>go run github.com/99designs/gqlgen generate</code><br>

Access the GraphQL server at localhost:<port> (replace <port> with your server's port).<br>
