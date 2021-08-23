defmodule ThathaBlog.Posts.Inputs.ChangePosts do
  use Ecto.Schema
  import Ecto.Changeset

  @required [:title, :content, :id]

  embedded_schema do
    field :title, :string
    field :content, :string
    # field :id
  end

  def changeset(params) do
    %__MODULE__{}
    |> cast(params, @required)
    |> validate_required(@required)
  end
end
