defmodule Lottery.UserFactory do
  @moduledoc false
  defmacro __using__(_opts) do
    quote do
      def user_factory(attrs) do
        %Lottery.Accounts.User{
          name: Faker.Person.PtBr.name(),
          email: Faker.Internet.safe_email()
        }
        |> Map.merge(attrs)
      end
    end
  end
end
