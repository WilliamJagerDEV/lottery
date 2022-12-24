defmodule LotteryWeb.FallbackController do
  @moduledoc """
  Translates controller action results into valid `Plug.Conn` responses.

  See `Phoenix.Controller.action_fallback/1` for more details.
  """
  use LotteryWeb, :controller

  # This clause handles errors returned by Ecto's insert/update/delete.
  def call(conn, {:error, %Ecto.Changeset{} = changeset}) do
    conn
    |> put_status(:unprocessable_entity)
    |> put_view(LotteryWeb.ChangesetView)
    |> render("error.json", changeset: changeset)
  end

  # This clause is an example of how to handle resources that cannot be found.
  def call(conn, {:error, :not_found}) do
    conn
    |> put_status(:not_found)
    |> put_view(LotteryWeb.ErrorView)
    |> render(:"404")
  end

  def call(conn, {:error, :not_exists}) do
    conn
    |> put_status(:not_found)
    |> put_view(LotteryWeb.ErrorView)
    |> render("error.json", info: %{raffle_id: ["does not exist"]})
  end

  # This clause is an example of how to handle resources that cannot be found.
  def call(conn, {:error, :unauthorized}) do
    conn
    |> put_status(401)
    |> put_view(LotteryWeb.ErrorView)
    |> render(:"401")
  end

  def call(conn, {:error, :bad_request}) do
    conn
    |> put_status(400)
    |> put_view(LotteryWeb.ErrorView)
    |> render(:"400")
  end

  def call(conn, {:error, :not_happened}) do
    conn
    |> put_status(422)
    |> put_view(LotteryWeb.ErrorView)
    |> render("error.json", message: "raffle waiting date of plays")
  end

  def call(conn, {:error, :expired_period_to_subscribe}) do
    conn
    |> put_status(422)
    |> put_view(LotteryWeb.ErrorView)
    |> render("error.json", message: "expired period to subscribe")
  end
end
