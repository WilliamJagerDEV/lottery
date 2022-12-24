defmodule Lottery.Factory do
  @moduledoc """
  Re-exporta as factories da aplicação
  """

  use ExMachina.Ecto, repo: Lottery.Repo
  use Lottery.UserFactory
  use Lottery.RaffleFactory
end
