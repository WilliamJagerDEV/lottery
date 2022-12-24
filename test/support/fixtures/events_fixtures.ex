defmodule Lottery.EventsFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `Lottery.Events` context.
  """

  @doc """
  Generate a raffle.
  """
  def raffle_fixture(attrs \\ %{}) do
    {:ok, raffle} =
      attrs
      |> Enum.into(%{
        name: "some name",
        raffle_date: ~N[2022-12-22 22:30:00]
      })
      |> Lottery.Events.create_raffle()

    raffle
  end
end
