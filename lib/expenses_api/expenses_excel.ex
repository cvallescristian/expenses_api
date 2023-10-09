defmodule ExpensesApi.ExpensesExcel do
  @moduledoc """
    Module to manage excel files
  """

  def import_expenses(path) do
    case Xlsxir.multi_extract(path) do
      [:ok, _reference] -> {:ok, true}
      {:error, message} -> {:error, message}
    end
  end
end
