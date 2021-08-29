defmodule ThathaBlog.Users.ListUsers do
  alias ThathaBlog.{Repo, User}

  def call() do
    users = Repo.all(User)
    {:list_users, users}
  end

  def list_one(%{"id" => id}) do
    case Repo.get(User, id) do
      nil -> {:error, "Usuário não existente"}
      user -> {:list_user, user}
    end
  end
end
