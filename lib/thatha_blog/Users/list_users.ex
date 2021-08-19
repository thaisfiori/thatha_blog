defmodule ThathaBlog.Users.ListUsers do
  alias ThathaBlog.{Repo, User}

  def call() do
    Repo.all(User)
  end

  def list_one(id) do
    case Repo.get(User, id) do
      nil -> {:error, "Usuário não existente"}
      user -> {:ok, user}
    end
  end
end
