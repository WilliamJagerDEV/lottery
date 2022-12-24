FROM bitwalker/alpine-elixir:1.13.4 AS build

RUN apk update && \
  apk add --no-cache tzdata ncurses-libs postgresql-client build-base openssh-client && \
  cp /usr/share/zoneinfo/America/Sao_Paulo /etc/localtime && \
  echo "America/Sao_Paulo" >/etc/timezone && \
  apk del tzdata

RUN mkdir /root/.ssh

RUN ssh-keyscan github.com >>/root/.ssh/known_hosts

WORKDIR /app

ARG MIX_ENV=prod

RUN mix do local.hex --force, local.rebar --force

COPY mix.exs mix.lock ./
COPY config config

RUN --mount=type=ssh mix do deps.get, deps.compile

COPY . ./
RUN mix do compile --warnings-as-errors, assets.deploy, release

# production stage
FROM alpine:3.12 AS production

# install dependencies
RUN apk upgrade --no-cache && \
  apk add ncurses-libs curl libgcc libstdc++

# setup timezone
ENV TZ America/Sao_Paulo

RUN apk add --no-cache tzdata && \
  cp /usr/share/zoneinfo/$TZ /etc/localtime && \
  echo $TZ >/etc/timezone

# setup app
WORKDIR /app
ARG MIX_ENV=prod

ENV USER=appuser
ENV GROUP=appgroup
ENV UID=1000
ENV GID=3000

RUN addgroup -S --gid "$GID" "$GROUP" && \
  adduser \
    --disabled-password \
    --gecos "" \
    --home "$(pwd)" \
    --ingroup "$GROUP" \
    --no-create-home \
    --uid "$UID" \
    "$USER" && chown -R "$USER":"$GROUP" /app

USER appuser

COPY --from=build --chown="$USER":"$GROUP" /app/_build/$MIX_ENV/rel/lottery ./
COPY --from=build --chown="$USER":"$GROUP" /app/start.sh ./start.sh

# start application
COPY start.sh ./
CMD ["sh", "./start.sh"]
