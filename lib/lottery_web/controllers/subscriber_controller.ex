defmodule LotteryWeb.SubscriberController do
  use LotteryWeb, :controller

  alias Lottery.Events
  alias Lottery.Events.{Raffle, UsersToRaffle}

  action_fallback LotteryWeb.FallbackController

  def create(conn, %{"subscribe" => %{"raffle_id" => raffle_id} = params}) do
    with %Raffle{raffle_date: raffle_date} <- Events.get_raffle!(raffle_id),
         :valid <- validate_date(raffle_date),
         {:ok, %UsersToRaffle{} = _users_to_raffle} <- Events.create_users_to_raffle(params) do
      conn
      |> put_status(:created)
      |> send_resp(200, "ok")
    end
  rescue
    _e in Ecto.NoResultsError -> {:error, :not_exists}
  end

  defp validate_date(raffle_date) do
    Date.utc_today()
    |> Date.diff(raffle_date)
    |> do_validate_date()
  end

  defp do_validate_date(diff) when diff < 0, do: :valid

  defp do_validate_date(_diff), do: {:error, :expired_period_to_subscribe}
end
