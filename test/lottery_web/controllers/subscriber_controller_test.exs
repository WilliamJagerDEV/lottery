defmodule LotteryWeb.SubscriberControllerTest do
  use LotteryWeb.ConnCase
  import Lottery.Factory

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  describe "Into range date" do
    test "Must subscribe user into raffle when ids are valids, is the first subscribe of user in raffle",
         %{conn: conn} do
      %{id: user_id} = insert(:user)
      %{id: raffle_id} = insert(:raffle)
      create_attrs = %{user_id: user_id, raffle_id: raffle_id}
      conn = post(conn, Routes.subscriber_path(conn, :create), subscribe: create_attrs)

      assert 200 == conn.status
      assert "ok" == response(conn, 200)
    end

    test "Must refute a second subscribe of a user in same raffle - with status 422",
         %{conn: conn} do
      %{id: user_id} = insert(:user)
      %{id: raffle_id} = insert(:raffle)
      create_attrs = %{user_id: user_id, raffle_id: raffle_id}
      conn = post(conn, Routes.subscriber_path(conn, :create), subscribe: create_attrs)

      assert 200 == conn.status
      assert "ok" == response(conn, 200)

      conn = post(conn, Routes.subscriber_path(conn, :create), subscribe: create_attrs)

      assert 422 == conn.status
      assert %{"errors" => %{"user_id" => ["has already been taken"]}} == json_response(conn, 422)
    end

    test "Must refute subscribe user when raffle id is valid and user id invalid - with status 422",
         %{conn: conn} do
      %{id: raffle_id} = insert(:raffle)
      create_attrs = %{user_id: Faker.UUID.v4(), raffle_id: raffle_id}
      conn = post(conn, Routes.subscriber_path(conn, :create), subscribe: create_attrs)

      assert 422 == conn.status
      assert %{"errors" => %{"user_id" => ["does not exist"]}} == json_response(conn, 422)
    end

    test "Must refute subscribe user when raffle id is invalid and user id valid - with status 404",
         %{conn: conn} do
      %{id: user_id} = insert(:user)
      create_attrs = %{user_id: user_id, raffle_id: Faker.UUID.v4()}
      conn = post(conn, Routes.subscriber_path(conn, :create), subscribe: create_attrs)

      assert 404 == conn.status
      assert %{"errors" => %{"raffle_id" => ["does not exist"]}} == json_response(conn, 404)
    end
  end

  describe "Out range date" do
    test "Must refute subscribe after playtime",
         %{conn: conn} do
      %{id: user_id} = insert(:user)
      %{id: raffle_id} = insert(:raffle, raffle_date: Faker.Date.backward(2))
      create_attrs = %{user_id: user_id, raffle_id: raffle_id}
      conn = post(conn, Routes.subscriber_path(conn, :create), subscribe: create_attrs)

      assert 422 == conn.status

      assert %{"errors" => %{"detail" => "expired period to subscribe"}} ==
               json_response(conn, 422)
    end
  end
end
