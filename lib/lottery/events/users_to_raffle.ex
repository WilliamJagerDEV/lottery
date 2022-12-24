defmodule Lottery.Events.UsersToRaffle do
  use Ecto.Schema
  import Ecto.Changeset

  alias Lottery.Accounts.User
  alias Lottery.Events.Raffle

  @foreign_key_type :binary_id

  schema "users_to_raffles" do
    belongs_to :user, User
    belongs_to :raffle, Raffle
  end

  def changeset(user_to_raffle, attrs) do
    user_to_raffle
    |> cast(attrs, [:user_id, :raffle_id])
    |> validate_required([:user_id, :raffle_id])
    |> foreign_key_constraint(:user_id)
    |> foreign_key_constraint(:raffle_id)
    |> unique_constraint([:user_id, :raffle_id])
  end
end
