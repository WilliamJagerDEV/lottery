defmodule Lottery.Results.RaffleWinner do
  use Ecto.Schema
  import Ecto.Changeset

  alias Lottery.Accounts.User
  alias Lottery.Events.Raffle

  @foreign_key_type :binary_id

  schema "raffle_winners" do
    belongs_to :winner, User
    belongs_to :raffle, Raffle
  end

  @doc false
  def changeset(raffle_winner, attrs) do
    raffle_winner
    |> cast(attrs, [:raffle_id, :winner_id])
    |> foreign_key_constraint(:winner_id)
    |> foreign_key_constraint(:raffle_id)
    |> validate_required([:raffle_id, :winner_id])
  end
end
