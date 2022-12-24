defmodule LotteryWeb.UserView do
  use LotteryWeb, :view
  alias LotteryWeb.UserView

  def render("index.json", %{users: users}) do
    %{data: render_many(users, UserView, "user.json")}
  end

  def render("show.json", %{user: user}) do
    %{data: render_one(user, UserView, "user.json")}
  end

  def render("created_user.json", %{user: user}) do
    %{
      id: user.id
    }
  end

  def render("user.json", %{user: user}) do
    %{
      id: user.id,
      email: user.email,
      name: user.name
    }
  end
end
