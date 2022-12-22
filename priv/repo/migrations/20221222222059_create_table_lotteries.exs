defmodule Lottery.Repo.Migrations.CreateTableLotteries do
  use Ecto.Migration

  def change do
    create table(:lotteries) do
      add :name, :string
      add :date, :utc_datetime

      timestamps(default: fragment("NOW()"))
    end
  end
end
