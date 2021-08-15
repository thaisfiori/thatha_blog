defmodule ThathaBlog.User do
  use Ecto.Schema
  import Ecto.Changeset

  @primary_key {:id, :binary_id, autogenerate: true}
  @required [:email, :password]
  @optional [:display_name, :image]

  schema "users" do
    field :display_name, :string
    field :email, :string
    field :password, :string
    field :image, :string
  end

  def changeset(params) do
    %__MODULE__{}
    |> cast(params, @required ++ @optional)
    |> validate_required(@required)
    |> validate_length(:password, min: 6)
    |> validate_length(:display_name, min: 8)
    |> validate_format(:email, ~r/@/)
    |> unique_constraint([:email])
  end
end
