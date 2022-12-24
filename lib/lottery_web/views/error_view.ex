defmodule LotteryWeb.ErrorView do
  use LotteryWeb, :view

  # If you want to customize a particular status code
  # for a certain format, you may uncomment below.
  def render("error.json", %{message: message}) do
    %{errors: %{detail: message}}
  end

  def render("error.json", %{info: info}) do
    %{errors: info}
  end

  # By default, Phoenix returns the status message from
  # the template name. For example, "404.json" becomes
  # "Not Found".
  def template_not_found(template, _assigns) do
    %{errors: %{detail: Phoenix.Controller.status_message_from_template(template)}}
  end
end
