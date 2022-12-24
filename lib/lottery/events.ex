defmodule Lottery.Events do
  @moduledoc """
  The Events context.
  """

  import Ecto.Query, warn: false
  alias Lottery.Repo

  alias Lottery.Events.{Raffle, UsersToRaffle}

  @doc """
  Gets a single raffle.

  Raises `Ecto.NoResultsError` if the Raffle does not exist.

  ## Examples

      iex> get_raffle!(123)
      %Raffle{}

      iex> get_raffle!(456)
      ** (Ecto.NoResultsError)

  """
  def get_raffle!(id), do: Repo.get!(Raffle, id)

  @doc """
  Creates a users_to_raffle.

  ## Examples

      iex> create_raffle(%{field: value})
      {:ok, %Raffle{}}

      iex> create_raffle(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_raffle(attrs \\ %{}) do
    %Raffle{}
    |> Raffle.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Creates a users_to_raffle.

  ## Examples

      iex> create_users_to_raffle(%{field: value})
      {:ok, %Raffle{}}

      iex> create_users_to_raffle(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_users_to_raffle(attrs \\ %{}) do
    %UsersToRaffle{}
    |> UsersToRaffle.changeset(attrs)
    |> Repo.insert()
  end
end
