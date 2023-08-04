defmodule ExpensesApi.AdminTest do
  use ExpensesApi.DataCase

  alias ExpensesApi.Admin

  describe "users" do
    alias ExpensesApi.Admin.User

    @valid_attrs %{
      name: "some-name",
      email: "some-email",
      password: "some-password"
    }
    @update_attrs %{
      name: "some-name-2",
      email: "some-email-2",
      password: "some-password-2"
    }
    @invalid_attrs %{
      name_wrong: "some-name",
      email_wrong: "some-email",
      password_wrong: "some-password"
    }

    def user_fixture(attrs \\ %{}) do
      {:ok, user} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Admin.create_user()

      user
    end

    test "[Success] list_users/0 returns all users" do
      user = user_fixture()
      assert Admin.list_users() == [user]
    end

    test "[Success] get_user!/1 returns the user with given id" do
      user = user_fixture()
      assert Admin.get_user(user.id) == user
    end

    test "[Error] get_user!/1 returns error when user doesn't exist" do
      random_uid = "70d584ff-16ab-4304-9fbb-2742162df5d4"
      assert Admin.get_user(random_uid) == nil
    end

    test "[Success] create_user/1 with valid data creates a user" do
      assert {:ok, %User{} = _user} = Admin.create_user(@valid_attrs)
    end

    test "[Error] create_user/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Admin.create_user(@invalid_attrs)
    end

    test "[Success] update_user/2 with valid data updates the user" do
      user = user_fixture()
      assert {:ok, %User{} = _user} = Admin.update_user(user, @update_attrs)
    end

    test "[Success] delete_user/1 deletes the user" do
      user = user_fixture()
      assert {:ok, %User{}} = Admin.delete_user(user)
      assert Admin.get_user(user.id) == nil
    end

    test "[Success] change_user/1 returns a user changeset" do
      user = user_fixture()
      assert %Ecto.Changeset{} = Admin.change_user(user)
    end
  end
end
