defmodule LotteryWeb.RaffleView do
  use LotteryWeb, :view
  alias LotteryWeb.RaffleView

  def render("index.json", %{raffles: raffles}) do
    %{data: render_many(raffles, RaffleView, "raffle.json")}
  end

  def render("show.json", %{raffle: raffle}) do
    %{data: render_one(raffle, RaffleView, "raffle.json")}
  end

  def render("created_raffle.json", %{raffle: raffle}) do
    %{
      id: raffle.id
    }
  end

  def render("raffle.json", %{raffle: raffle}) do
    %{
      id: raffle.id,
      name: raffle.name,
      raffle_date: raffle.raffle_date
    }
  end
end
