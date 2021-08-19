defmodule ThathaBlog do
  @moduledoc """
  ThathaBlog keeps the contexts that define your domain
  and business logic.

  Contexts are also responsible for managing your data, regardless
  if it comes from the database, an external API or others.
  """
  alias ThathaBlog.Users.Create, as: UserCreate
  alias ThathaBlog.Users.Delete, as: UserDelete
  alias ThathaBlog.Users.ListUsers, as: ListUsers
  alias ThathaBlog.Users.SignIn, as: UserSignIn

  defdelegate create_user(params), to: UserCreate, as: :call
  defdelegate list_users(), to: ListUsers, as: :call
  defdelegate list_users(params), to: ListUsers, as: :list_one
  defdelegate sign_in(params), to: UserSignIn, as: :call
  defdelegate delete_me(params), to: UserDelete, as: :call
end
