defmodule Lottery.AccountsFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `Lottery.Accounts` context.
  """

  def unique_user_email, do: "user#{System.unique_integer()}@example.com"
  def valid_user_name, do: "Nome Maneiro"

  def valid_user_attributes(attrs \\ %{}) do
    Enum.into(attrs, %{
      email: unique_user_email(),
      name: valid_user_name()
    })
  end

  def user_fixture(attrs \\ %{}) do
    {:ok, user} =
      attrs
      |> valid_user_attributes()
      |> Lottery.Accounts.create_user()

    user
  end
end
