defmodule ThathaBlog.Posts.Create do
  alias ThathaBlog.{Repo, Post}

  def call(params) do
    params
    |> Post.changeset()
    |> Repo.insert()
  end
end
