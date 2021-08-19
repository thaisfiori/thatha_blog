defmodule ThathaBlog.Users.Delete do
  alias ThathaBlog.{Repo, User}

  def call(owner_id) do
    user = Repo.get(User, owner_id)

    case Repo.delete(user) do
      {:ok, _struct} -> {:ok, "User deleted"}
      {:error, _changeset} -> {:error}
    end
  end
end
