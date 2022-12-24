defmodule LotteryWeb.UserController do
  use LotteryWeb, :controller

  alias Lottery.Accounts
  alias Lottery.Accounts.User

  action_fallback LotteryWeb.FallbackController

  def create(conn, %{"user" => user_params}) do
    with {:ok, %User{} = user} <- Accounts.create_user(user_params) do
      conn
      |> put_status(:created)
      |> render("created_user.json", user: user)
    end
  end
end
