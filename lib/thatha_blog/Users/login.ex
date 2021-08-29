defmodule ThathaBlog.Users.Login do
  alias ThathaBlog.{Repo, Token, User}
  alias ThathaBlog.Users.Inputs.LoginUser

  def call(params) do
    user = LoginUser.changeset(params)

    case user.valid? do
      true -> compare(user.changes)
      false -> {:error, user}
    end
  end

  defp compare(%{email: email, password: pass}) do
    user = Repo.get_by(User, %{email: email})

    case Bcrypt.check_pass(user, pass) do
      {:ok, user} -> {:ok, user.id}
      {:error, _reason} -> {:error, "Campos inválidos"}
    end
  end
end
