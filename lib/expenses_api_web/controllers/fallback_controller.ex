defmodule ExpensesApiWeb.FallbackController do
  @moduledoc """
  Translates controller action results into valid `Plug.Conn` responses.

  See `Phoenix.Controller.action_fallback/1` for more details.
  """
  use ExpensesApiWeb, :controller

  # This clause is an example of how to handle resources that cannot be found.
  def call(conn, {:error, :not_found}) do
    conn
    |> put_status(:not_found)
    |> put_view(ExpensesApiWeb.ErrorView)
    |> render(:"404")
  end

  # Changeset callback
  def call(conn, {:error, %Ecto.Changeset{} = changeset}) do
    conn
    |> put_status(:unprocessable_entity)
    |> put_view(ExpensesApiWeb.ErrorView)
    |> render("422.json")
  end

  def call(conn, _) do
    conn
    |> put_status(500)
    |> put_view(ExpensesApiWeb.ErrorView)
    |> render("500.json")
  end
end
