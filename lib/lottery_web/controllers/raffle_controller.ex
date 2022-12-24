defmodule LotteryWeb.RaffleController do
  use LotteryWeb, :controller

  alias Lottery.Events
  alias Lottery.Events.Raffle

  action_fallback LotteryWeb.FallbackController

  def create(conn, %{"raffle" => raffle_params}) do
    with raffle_date <- Map.get(raffle_params, "date"),
         raffle_date <- format_date(raffle_date),
         new_params <- Map.put(raffle_params, "raffle_date", raffle_date),
         {:ok, %Raffle{} = raffle} <- Events.create_raffle(new_params) do
      conn
      |> put_status(:created)
      |> render("created_raffle.json", raffle: raffle)
    end
  end

  def create(_conn, _params), do: {:error, :bad_request}

  defp format_date(nil), do: {:error, :bad_request}
  defp format_date(""), do: {:error, :bad_request}

  defp format_date(raffle_date) when is_binary(raffle_date),
    do: String.replace(raffle_date, ~r/\D/, "-")

  defp format_date(raffle_date) when is_struct(raffle_date), do: raffle_date
  defp format_date(_raffle_date), do: {:error, :bad_request}
end
