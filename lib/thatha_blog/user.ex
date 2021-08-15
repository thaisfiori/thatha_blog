defmodule ThathaBlog.User do
  use Ecto.Schema
  import Ecto.Changeset
  alias Ecto.Changeset

  @primary_key {:id, :binary_id, autogenerate: true}
  @required [:email, :password]
  @optional [:display_name, :image]

  schema "users" do
    field :display_name, :string
    field :email, :string
    field :password_hash, :string
    field :password, :string, virtual: true
    field :image, :string

    timestamps()
  end

  def changeset(params) do
    %__MODULE__{}
    |> cast(params, @required ++ @optional)
    |> validate_required(@required)
    |> validate_length(:password, min: 6)
    |> validate_length(:display_name, min: 8)
    |> validate_format(:email, ~r/@/)
    |> unique_constraint([:email])
    |> put_password_hash()
  end

  defp put_password_hash(%Changeset{valid?: true, changes: %{password: password}} = changeset) do
    change(changeset, Bcrypt.add_hash(password))
  end

  defp put_password_hash(changeset), do: changeset
end
