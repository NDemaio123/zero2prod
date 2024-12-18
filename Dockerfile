FROM rust:1.83.0-alpine AS builder

WORKDIR /app
RUN apk add --no-cache lld clang openssl-dev ca-certificates musl-dev
COPY . .
ENV SQLX_OFFLINE=true
RUN cargo build --release

FROM alpine:3.21 AS runtime

WORKDIR /app
RUN apk add --no-cache ca-certificates openssl
COPY --from=builder /app/target/release/zero2prod zero2prod
COPY configuration configuration
ENV APP_ENVIRONMENT=production
ENTRYPOINT [ "./zero2prod" ]
