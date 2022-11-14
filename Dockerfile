ARG ELIXIR_VERSION=1.14.0
ARG OTP_VERSION=25.1
ARG DEBIAN_VERSION=bullseye-20220801-slim

ARG BUILDER_IMAGE="hexpm/elixir:${ELIXIR_VERSION}-erlang-${OTP_VERSION}-debian-${DEBIAN_VERSION}"
ARG RUNNER_IMAGE="debian:${DEBIAN_VERSION}"

FROM ${BUILDER_IMAGE} as base

# install inotify-tools for hot reloading
# install build dependencies
RUN apt-get update -y && \
    apt-get install -y build-essential git inotify-tools && \
    apt-get clean && \
    rm -f /var/lib/apt/lists/*_*

# install hex + rebar
RUN mix local.hex --force && \
    mix local.rebar --force

WORKDIR /app

# mirror host files to container
COPY . .

# install mix dependencies and compile
RUN mix deps.get
RUN mix deps.compile

CMD ["mix", "phx.server"]
