defmodule LotteryWeb.RegistrationView do
  use LotteryWeb, :view

  def render("error.json", %{message: message}) do
    # When encoded, the changeset returns its errors
    # as a JSON object. So we just pass it forward.
    %{errors: message}
  end

  def render("user_created.json", %{user: user}) do
    %{
      id: user.id
    }
  end
end
