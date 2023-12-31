FROM elixir:latest

WORKDIR /app

ADD . /app

RUN apt-get update && apt-get -y install npm build-essential inotify-tools
RUN npm install --prefix ./assets
RUN mix local.hex --force && mix local.rebar --force
RUN mix do deps.get, compile

RUN chmod +x ./run.sh

EXPOSE 4000

CMD ["./run.sh"]