defmodule Lottery.ResultsFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `Lottery.Results` context.
  """

  @doc """
  Generate a raffle_winner.
  """
  def raffle_winner_fixture(attrs \\ %{}) do
    {:ok, raffle_winner} =
      attrs
      |> Enum.into(%{
        raffle_id: Faker.UUID.v4(),
        winner_id: Faker.UUID.v4()
      })
      |> Lottery.Results.create_raffle_winner()

    raffle_winner
  end
end
