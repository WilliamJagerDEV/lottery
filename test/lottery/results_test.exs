defmodule Lottery.ResultsTest do
  use Lottery.DataCase

  alias Lottery.Results
  import Lottery.Factory

  describe "raffle_winners" do
    import Lottery.ResultsFixtures

    test "get_raffle_winner!/1 returns the raffle_winner with given id" do
      %{id: user_id} = winner = insert(:user)
      %{id: raffle_id} = insert(:raffle)
      raffle_winner_fixture(%{winner_id: user_id, raffle_id: raffle_id})
      assert Results.get_raffle_winner!(raffle_id).winner == winner
    end

    test "get_raffle_winner!/1 returns nil when not defined a winner" do
      %{id: raffle_id} = insert(:raffle)
      assert is_nil(Results.get_raffle_winner!(raffle_id))
    end
  end
end
