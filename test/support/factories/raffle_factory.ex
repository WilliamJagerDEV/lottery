defmodule Lottery.RaffleFactory do
  @moduledoc false

  alias Faker.{Date, Person.PtBr}
  alias Lottery.Events.Raffle

  defmacro __using__(_opts) do
    quote do
      def raffle_factory(attrs) do
        %Raffle{
          name: PtBr.name(),
          raffle_date: Date.forward(7)
        }
        |> Map.merge(attrs)
      end
    end
  end
end
