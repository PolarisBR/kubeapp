FROM elixir:1.12-alpine as BUILD
LABEL maintainer="Bruno Ripa <bruno.ripa@gmail.com>"

COPY . /app

WORKDIR /app

RUN mix local.rebar --force
RUN mix local.hex --force
RUN mix deps.get
RUN sh ./run_tests.sh

RUN mix deps.clean --all
RUN mix deps.get --only prod
RUN mix deps.compile --all
RUN MIX_ENV=prod mix release kubeapp

RUN ls -la /app
