defmodule ThathaBlogWeb.UsersController do
  use ThathaBlogWeb, :controller
  alias ThathaBlog.User

  def create(conn, params) do
    params
    |> ThathaBlog.create_user()
    |> handle_response(conn)
  end

  defp handle_response({:ok, %User{} = user}, conn) do
    conn
    |> put_status(:created)
    |> render("create.json", user: user)
    |> json(%{message: "User created successfully"})
  end

  defp handle_response({:error, reason}, conn) do
    conn
    |> put_status(:bad_request)
    |> put_view(ThathaBlogWeb.ErrorView)
    |> render("400.json", result: reason)
  end
end
