FROM elixir:1.12-alpine as BUILD
LABEL maintainer="Bruno Ripa <bruno.ripa@gmail.com>"

COPY . /app

WORKDIR /app

RUN mix local.rebar --force
RUN mix local.hex --force
RUN mix deps.clean --all
RUN mix deps.get --only prod
RUN mix deps.compile --all
RUN MIX_ENV=prod mix phx.digest
RUN MIX_ENV=prod mix release kubeapp

RUN ls -la /app

FROM alpine:latest
RUN apk update && apk add openssh openssl-dev gcc
WORKDIR /app

COPY --from=BUILD /app/_build/prod/kubeapp-0.1.0.tar.gz /
RUN tar xzfv /kubeapp-0.1.0.tar.gz -C /app
