FROM rust:1.67 as builder
WORKDIR /usr/src/rust-rest-boilerplate
COPY . .
RUN cargo install --path .

FROM debian:bullseye-slim
RUN apt-get update && rm -rf /var/lib/apt/lists/*
COPY --from=builder /usr/local/cargo/bin/rust-rest-boilerplate /usr/local/bin/rust-rest-boilerplate
EXPOSE 8080
CMD ["rust-rest-boilerplate"]
