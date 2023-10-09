#!/bin/sh
mix ecto.craete
mix ecto.migrate
exec iex -S mix phx.server

