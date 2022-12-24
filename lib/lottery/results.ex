defmodule Lottery.Results do
  @moduledoc """
  The Results context.
  """

  import Ecto.Query, warn: false
  alias Lottery.Repo

  alias Lottery.Results.RaffleWinner

  @doc """
  Gets a single raffle_winner.

  Raises `Ecto.NoResultsError` if the Raffle winner does not exist.

  ## Examples

      iex> get_raffle_winner!("72ff4186-2e5b-488a-8c96-e10e3c0cab55")
      %Lottery.Accounts.User{}

      iex> get_raffle_winner!("08189e48-1bb8-4103-a7c8-837a5eb17014")
      ** (Ecto.NoResultsError)

  """
  def get_raffle_winner!(id) do
    RaffleWinner
    |> join(:inner, [rw], w in assoc(rw, :winner))
    |> where([rw], rw.raffle_id == ^id)
    |> preload([:winner, :raffle])
    |> Repo.one()
  end

  @doc """
  Creates a raffle_winner.

  ## Examples

      iex> create_raffle_winner(%{winner_id: winner_id, raffle_id: raffle_id})
      {:ok, %RaffleWinner{}}

      iex> create_raffle_winner(%{winner_id: winner_id})
      {:error, %Ecto.Changeset{}}

  """
  def create_raffle_winner(attrs \\ %{}) do
    %RaffleWinner{}
    |> RaffleWinner.changeset(attrs)
    |> Repo.insert()
  end
end
