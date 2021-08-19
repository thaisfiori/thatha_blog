defmodule ThathaBlog.Users.SignIn do
  alias ThathaBlog.{Repo, User}

  def call(params) do
    params
    |> User.changeset()
    |> Repo.insert()
  end
end
