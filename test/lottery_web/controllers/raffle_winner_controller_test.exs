defmodule LotteryWeb.RaffleWinnerControllerTest do
  use LotteryWeb.ConnCase

  import Lottery.Factory
  import Lottery.ResultsFixtures

  # alias Lottery.Results.RaffleWinner

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  describe "show raffle_winner" do
    test "renders raffle_winner when pasted play time and a winner was choosed", %{conn: conn} do
      %{id: user_id, name: name, email: email} = insert(:user)
      %{id: raffle_id} = insert(:raffle)

      raffle_winner_fixture(%{winner_id: user_id, raffle_id: raffle_id})

      conn = get(conn, Routes.raffle_winner_path(conn, :show, raffle_id))

      assert %{
               "winner_id" => ^user_id,
               "raffle_id" => ^raffle_id,
               "name" => ^name,
               "email" => ^email
             } = json_response(conn, 200)
    end

    test "renders 422 message when winner not was choosed", %{conn: conn} do
      %{id: raffle_id} = insert(:raffle)

      conn = get(conn, Routes.raffle_winner_path(conn, :show, raffle_id))
      assert json_response(conn, 422)["errors"] != %{}
    end
  end
end
