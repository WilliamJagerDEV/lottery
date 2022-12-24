defmodule Lottery.AccountsTest do
  use Lottery.DataCase

  alias Lottery.Accounts

  describe "users" do
    alias Lottery.Accounts.User

    @invalid_attrs %{email: nil, id: nil, name: nil}

    test "create_user/1 with valid data creates a user" do
      valid_attrs = %{
        email: "some@email",
        name: "some name"
      }

      assert {:ok, %User{} = user} = Accounts.create_user(valid_attrs)
      assert user.email == "some@email"
      assert user.name == "some name"
    end

    test "create_user/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Accounts.create_user(@invalid_attrs)
    end
  end
end
