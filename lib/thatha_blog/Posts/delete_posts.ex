defmodule ThathaBlog.Posts.Delete do
  alias ThathaBlog.{Repo, Post}

  def call(id) do
    post = Repo.get(Post, id)

    case Repo.delete(post) do
      {:ok, _struct} -> {:ok, "Post deleted"}
      {:error, _changeset} -> {:error}
    end
  end
end
