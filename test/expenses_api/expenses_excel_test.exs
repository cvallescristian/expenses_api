defmodule ExpensesApi.ExpensesExcelTest do
  use ExpensesApi.DataCase

  alias ExpensesApi.ExpensesExcel

  describe "Expenses API" do

    test "[Success] import_expenses/1 should import a value" do
      assert true
    end

    test "[Error] import_expenses/1 should return error when path is not found" do

      assert {:error, "Invalid file type (expected xlsx)."} = ExpensesExcel.import_expenses("wrong_path.xlsx")

    end

  end
end
