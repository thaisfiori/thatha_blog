defmodule ThathaBlog do
  @moduledoc """
  ThathaBlog keeps the contexts that define your domain
  and business logic.

  Contexts are also responsible for managing your data, regardless
  if it comes from the database, an external API or others.
  """
  alias ThathaBlog.Users.SignIn, as: UserSignIn

  alias ThathaBlog.Users.Create, as: UserCreate
  alias ThathaBlog.Users.Delete, as: UserDelete
  alias ThathaBlog.Users.ListUsers, as: ListUsers

  alias ThathaBlog.Posts.Create, as: PostCreate
  alias ThathaBlog.Posts.ListPosts, as: PostList

  defdelegate sign_in(params), to: UserSignIn, as: :call

  # users actions
  defdelegate create_user(params), to: UserCreate, as: :call
  defdelegate list_users(), to: ListUsers, as: :call
  defdelegate list_users(params), to: ListUsers, as: :list_one
  defdelegate delete_me(params), to: UserDelete, as: :call

  # post actions
  defdelegate create_post(params), to: PostCreate, as: :call
  defdelegate list_post(), to: PostList, as: :call
  defdelegate list_post(params), to: PostList, as: :list_one
end
