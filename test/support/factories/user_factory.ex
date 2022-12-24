defmodule Lottery.UserFactory do
  @moduledoc false
  alias Faker.{Internet, Person.PtBr}
  alias Lottery.Accounts.User

  defmacro __using__(_opts) do
    quote do
      def user_factory(attrs) do
        %User{
          name: PtBr.name(),
          email: Internet.safe_email()
        }
        |> Map.merge(attrs)
      end
    end
  end
end
