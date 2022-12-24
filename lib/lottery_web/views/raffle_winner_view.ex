defmodule LotteryWeb.RaffleWinnerView do
  use LotteryWeb, :view

  def render("winner.json", %{winner: winner, raffle: raffle}) do
    %{
      winner_id: winner.id,
      raffle_id: raffle.id,
      email: winner.email,
      name: winner.name
    }
  end
end
