defmodule Lottery.Repo.Migrations.CreateRaffles do
  use Ecto.Migration

  def change do
    create table(:raffles, primary_key: false) do
      add :id, :binary_id, primary_key: true
      add :name, :string
      add :raffle_date, :date

      timestamps()
    end

    create unique_index(:raffles, [:name, :raffle_date])
  end
end
