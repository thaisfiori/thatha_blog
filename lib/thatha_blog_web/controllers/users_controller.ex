defmodule ThathaBlogWeb.UsersController do
  use ThathaBlogWeb, :controller
  alias ThathaBlog.User
  alias Ecto.Changeset

  def create(conn, params) do
    params
    |> ThathaBlog.create_user()
    |> handle_response(conn)
  end

  def list(_conn, _params) do
    # validate with token
    ThathaBlog.list_users()

    # |> handle_response(conn)
  end

  def index(conn, params) do
    params
    |> ThathaBlog.list_users()
    |> handle_response(conn)
  end

  def delete(_conn, params) do
    params
    |> ThathaBlog.delete_me()

    # |> handle_response(conn)
  end

  defp handle_response({:ok, %User{} = user}, conn) do
    conn
    |> put_status(:created)
    |> render("create.json", user: user)
    |> json(%{message: "User created successfully"})
  end

  defp handle_response({:error, changeset}, conn) do
    %Changeset{errors: errors} = changeset

    case errors do
      [email: {"has already been taken", _}] ->
        conn
        |> put_status(:conflict)
        |> json(%{message: "Usuário já existe"})

      [_] ->
        conn
        |> put_status(:bad_request)
        |> put_view(ThathaBlogWeb.ErrorView)
        |> render("400.json", result: changeset)
    end
  end

  def sign_in(_conn, params) do
    params
    |> IO.inspect()
  end
end
