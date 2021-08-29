defmodule ThathaBlogWeb.UsersController do
  use ThathaBlogWeb, :controller

  alias ThathaBlog.{Token, User}
  alias Ecto.Changeset

  def create(conn, params) do
    with {:ok, %User{id: id}} <- ThathaBlog.create_user(params) do
      Token.generate_and_sign(%{"id" => id})
    else
      {:error, reason} -> {:error, reason}
    end
    |> handle_response(conn)
  end

  def login(conn, params) do
    with {:ok, id} <- ThathaBlog.login(params) do
      {:ok, token, _} = Token.generate_and_sign(%{"id" => id})
      {:login, token}
    else
      {:error, reason} -> {:error, reason}
    end
    |> handle_response(conn)
  end

  def list(conn, _params) do
    # validate with token
    ThathaBlog.list_users()
    |> handle_response(conn)
  end

  def list_one(conn, params) do
    # validate with token
    params
    |> ThathaBlog.list_users()
    |> IO.inspect()
    |> handle_response(conn)
  end

  def delete(_conn, params) do
    params
    |> ThathaBlog.delete_me()

    # |> handle_response(conn)
  end

  defp handle_response({:list_user, %User{} = user}, conn) do
    conn
    |> put_status(:ok)
    |> render("list_one.json", user: user)
    |> json(%{message: "User created successfully"})
  end

  defp handle_response({:list_users, users}, conn) do
    conn
    |> put_status(:ok)
    |> render("list.json", users: users)
    |> json(%{message: "User created successfully"})
  end

  # defp handle_response([users], conn) do
  #   conn
  #   |> put_status(:ok)
  #   |> render("create.json", user: users)
  #   |> json(%{message: "User created successfully"})
  # end

  defp handle_response({:ok, token, _}, conn) do
    conn
    |> put_status(:created)
    |> json(%{token: token})
  end

  defp handle_response({:login, token}, conn) do
    conn
    |> put_status(:ok)
    |> json(%{token: token})
  end

  defp handle_response({:error, changeset = %Changeset{errors: errors}}, conn) do
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

  defp handle_response({:error, reason}, conn) do
    conn
    |> put_status(:not_found)
    |> json(%{message: reason})
  end
end
