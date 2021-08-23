defmodule ThathaBlog.Posts.Update do
  alias ThathaBlog.Repo
  alias Ecto.Changeset
  alias ThathaBlog.Posts.Inputs.ChangePosts

  def call(params = %{id: id}) do
    with {:ok, post} <- ThathaBlog.list_post(id),
         {:ok, _} <- cast_and_apply(post, params) do
      {:ok, params}
    end
  end

  defp cast_and_apply(post, params) do
    changes =
      params
      |> ChangePosts.changeset()

    changes.valid?
    |> case do
      true -> {:ok, Changeset.change(post, params) |> Repo.update()}
      false -> {:error, changes.errors}
    end
  end
end
