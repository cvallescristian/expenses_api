#!/bin/sh
mix ecto.create
mix ecto.migrate
exec iex -S mix phx.server

