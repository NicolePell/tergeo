FROM bitwalker/alpine-elixir-phoenix:latest

MAINTAINER Nicole Pellicena <nicole.pellicena@gmail.com>

ENV MIX_ENV dev
ENV PORT 4000

ADD . /app
WORKDIR /app

RUN mix local.hex --force
RUN mix deps.get
RUN mix compile
RUN mix phx.digest

EXPOSE $PORT
CMD ["mix", "phx.server"]