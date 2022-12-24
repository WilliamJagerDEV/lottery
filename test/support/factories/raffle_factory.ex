defmodule Lottery.RaffleFactory do
  @moduledoc false

  defmacro __using__(_opts) do
    quote do
      def raffle_factory(attrs) do
        %Lottery.Events.Raffle{
          name: Faker.Person.PtBr.name(),
          raffle_date: Faker.Date.forward(7)
        }
        |> Map.merge(attrs)
      end
    end
  end
end
