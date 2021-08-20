defmodule ThathaBlog.Post do
  use Ecto.Schema
  import Ecto.Changeset
  alias ThathaBlog.User

  @primary_key {:id, :binary_id, autogenerate: true}
  @foreign_key_type :binary_id
  @required [:title, :content, :user_id]

  schema "posts" do
    field :title, :string
    field :content, :string
    belongs_to :user, User

    timestamps()
  end

  def changeset(params) do
    IO.inspect(params)

    %__MODULE__{}
    |> cast(params, @required)
    |> validate_required(@required)
  end
end
