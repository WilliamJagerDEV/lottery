defmodule Lottery.Repo.Migrations.CreateTableUsers do
  use Ecto.Migration

  def change do
    create table(:users) do
      add :name, :string
      add :email, :string
      add :lottery_id, references(:lotteries)

      timestamps(default: fragment("NOW()"))
    end
  end
end
