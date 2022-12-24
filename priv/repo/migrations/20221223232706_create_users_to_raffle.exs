defmodule Lottery.Repo.Migrations.CreateUsersToRaffle do
  use Ecto.Migration

  def change do
    create table(:users_to_raffles) do
      add :user_id, references(:users, type: :uuid)
      add :raffle_id, references(:raffles, type: :uuid)
    end

    create unique_index(:users_to_raffles, [:user_id, :raffle_id])
  end
end
