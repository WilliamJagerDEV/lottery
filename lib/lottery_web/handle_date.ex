defmodule LotteryWeb.HandleDate do
  def format_date(nil), do: {:error, :bad_request}
  def format_date(""), do: {:error, :bad_request}

  def format_date(raffle_date) when is_binary(raffle_date),
    do: String.replace(raffle_date, ~r/\D/, "-")

  def format_date(raffle_date) when is_struct(raffle_date), do: raffle_date
  def format_date(_raffle_date), do: {:error, :bad_request}

  def validate_date(raffle_date) do
    Date.utc_today()
    |> Date.diff(raffle_date)
    |> do_validate_date()
  end

  def do_validate_date(diff) when diff <= 0, do: :valid

  def do_validate_date(_diff), do: {:error, :expired_period_to_subscribe}
end
