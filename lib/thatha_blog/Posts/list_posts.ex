defmodule ThathaBlog.Posts.ListPosts do
  alias ThathaBlog.{Post, Repo}

  def call() do
    Repo.all(Post)
  end

  def list_one(id) do
    case Repo.get(Post, id) do
      nil -> {:error, "Post não existente"}
      post -> {:ok, post}
    end
  end
end
