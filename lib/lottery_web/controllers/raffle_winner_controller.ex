defmodule LotteryWeb.RaffleWinnerController do
  use LotteryWeb, :controller

  alias Lottery.Accounts.User
  alias Lottery.Results
  alias Lottery.Results.RaffleWinner

  action_fallback LotteryWeb.FallbackController

  def show(conn, %{"id" => id}) do
    id
    |> Results.get_raffle_winner!()
    |> handle_result(conn)
  end

  defp handle_result(%RaffleWinner{winner: %User{} = winner, raffle: raffle}, conn),
    do: render(conn, "winner.json", winner: winner, raffle: raffle)

  defp handle_result(nil, _conn), do: {:error, :not_happened}
end
