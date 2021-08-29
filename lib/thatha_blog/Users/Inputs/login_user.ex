defmodule ThathaBlog.Users.Inputs.LoginUser do
  use Ecto.Schema
  import Ecto.Changeset

  @required [:email, :password]
  @email_regex ~r<\A[a-zA-Z0-9!#$%&'*+/=?^_`{|}~.-]+@[a-zA-Z0-9-]+(\.[a-zA-Z0-9-]+)*\z>

  embedded_schema do
    field :email, :string
    field :password, :string
  end

  def changeset(params) do
    %__MODULE__{}
    |> cast(params, @required)
    |> validate_required(@required)
    |> validate_format(:email, @email_regex)
  end
end
