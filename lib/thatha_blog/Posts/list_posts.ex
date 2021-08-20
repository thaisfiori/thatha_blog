defmodule ThathaBlog.Posts.ListPosts do
  alias ThathaBlog.{Post, Repo}
  import Ecto.Query

  def call() do
    Repo.all(Post)
  end

  def list_one(user_id) do
    Post
    |> where([p], p.user_id == ^user_id)
    |> Repo.all()
  end
end
