defmodule Lottery.Events.Raffle do
  use Ecto.Schema
  import Ecto.Changeset

  alias Lottery.Accounts.User

  @primary_key {:id, :binary_id, autogenerate: true}

  schema "raffles" do
    field :name, :string
    field :raffle_date, :date

    has_many :users, {"users_to_raffles", User}, foreign_key: :user_id

    timestamps()
  end

  @doc false
  def changeset(raffle, attrs) do
    raffle
    |> cast(attrs, [:name, :raffle_date])
    |> validate_required([:name, :raffle_date])
    |> unique_constraint([:name, :raffle_date])
  end
end
