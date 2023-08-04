# Script for populating the database. You can run it as:
#
#     mix run priv/repo/seeds.exs
#
# Inside the script, you can read and write to any of your
# repositories directly:
#
#     ExpensesApi.Repo.insert!(%ExpensesApi.SomeSchema{})
#
# We recommend using the bang functions (`insert!`, `update!`
# and so on) as they will fail if something goes wrong.
alias ExpensesApi.Repo
alias ExpensesApi.Admin
alias ExpensesApi.Admin.User

# Delete all users
User |> Repo.delete_all()

# Create default user
Admin.create_user(%{
  name: "Cristian Valles Pereira",
  email: "valles.cristian1992@gmail.com",
  password: "6411621516",
})
