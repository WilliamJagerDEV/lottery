defmodule LotteryWeb.RaffleControllerTest do
  use LotteryWeb.ConnCase

  @create_attrs %{
    name: "some name",
    date: "2022-12-22"
  }

  @create_attrs2 %{
    name: "some name",
    date: ~D[2022-12-22]
  }

  @invalid_attrs %{name: nil, date: nil}

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  describe "create raffle" do
    test "renders raffle when data is valid - using string for date", %{conn: conn} do
      conn = post(conn, Routes.raffle_path(conn, :create), raffle: @create_attrs)
      assert %{"id" => _id} = json_response(conn, 201)
    end

    test "renders raffle when data is valid - using date type for date", %{conn: conn} do
      conn = post(conn, Routes.raffle_path(conn, :create), raffle: @create_attrs2)
      assert %{"id" => _id} = json_response(conn, 201)
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, Routes.raffle_path(conn, :create), raffle: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end
end
