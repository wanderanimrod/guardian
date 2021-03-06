FROM elixir:1.7.3-alpine as build

# install build dependencies
RUN apk add --update git

# prepare build dir
RUN mkdir /app
WORKDIR /app

# install hex + rebar
RUN mix local.hex --force && \
    mix local.rebar --force

# set build ENV
ENV MIX_ENV=prod

# install mix dependencies
COPY mix.exs ./
RUN mix deps.get
RUN mix deps.compile

# build release
COPY . .
# test that the secret not set to the literal command :)
ENV SECRET_KEY_BASE="$(mix phx.gen.secret)" 
RUN mix release --no-tar --verbose

# prepare release image
FROM alpine:3.8
RUN apk add --update bash openssl

RUN mkdir /app && chown -R root: /app
WORKDIR /app
USER root

COPY --from=build /app/_build/prod/rel/guardian ./

ENV REPLACE_OS_VARS=true
ENV HTTPS_PORT=443 BEAM_PORT=14000 ERL_EPMD_PORT=24000
EXPOSE $HTTPS_PORT $BEAM_PORT $ERL_EPMD_PORT

ENTRYPOINT ["/app/bin/guardian"]