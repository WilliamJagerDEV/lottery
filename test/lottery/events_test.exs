defmodule Lottery.EventsTest do
  use Lottery.DataCase

  alias Lottery.Events

  describe "raffles" do
    alias Lottery.Events.Raffle

    @invalid_attrs %{name: nil, raffle_date: nil}

    test "create_raffle/1 with valid data creates a raffle" do
      valid_attrs = %{name: "some name", raffle_date: ~D[2022-12-22]}

      assert {:ok, %Raffle{} = raffle} = Events.create_raffle(valid_attrs)
      assert raffle.name == "some name"
      assert raffle.raffle_date == ~D[2022-12-22]
    end

    test "create_raffle/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Events.create_raffle(@invalid_attrs)
    end
  end
end
