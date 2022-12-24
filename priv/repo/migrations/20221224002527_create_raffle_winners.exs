defmodule Lottery.Repo.Migrations.CreateRaffleWinners do
  use Ecto.Migration

  def change do
    create table(:raffle_winners) do
      add :raffle_id, references(:raffles, type: :uuid)
      add :winner_id, references(:users, type: :uuid)
    end

    create unique_index(:raffle_winners, [:winner_id, :raffle_id])
  end
end
