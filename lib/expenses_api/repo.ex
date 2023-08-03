defmodule ExpensesApi.Repo do
  use Ecto.Repo,
    otp_app: :expenses_api,
    adapter: Ecto.Adapters.Postgres
end
