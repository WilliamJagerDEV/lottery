defmodule LotteryWeb.SubscriberController do
  use LotteryWeb, :controller

  alias Lottery.Events
  alias Lottery.Events.{Raffle, UsersToRaffle}
  alias LotteryWeb.HandleDate

  action_fallback LotteryWeb.FallbackController

  def create(conn, %{"subscribe" => %{"raffle_id" => raffle_id} = params}) do
    with %Raffle{raffle_date: raffle_date} <- Events.get_raffle(raffle_id),
         :valid <- HandleDate.validate_date(raffle_date),
         {:ok, %UsersToRaffle{} = _users_to_raffle} <- Events.create_users_to_raffle(params) do
      conn
      |> put_status(:created)
      |> send_resp(200, "ok")
    end
  end
end
