defmodule ThathaBlogWeb.WelcomeController do
  use ThathaBlogWeb, :controller

  def index(conn, _params) do
    text(conn, "Welcome to the ThathaBlog API")
  end
end
