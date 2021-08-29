defmodule ThathaBlogWeb.UsersView do
  def render("create.json", %{user: _user}) do
    %{
      Message: "User created"
    }
  end

  def render("list_one.json", %{user: user}) do
    %{
      id: user.id,
      displayName: user.display_name,
      email: user.email,
      image: user.image
    }
  end

  def render("list.json", %{users: users}) do
    IO.inspect(users)

    Enum.map(users, fn user ->
      %{
        id: user.id,
        displayName: user.display_name,
        email: user.email,
        image: user.image
      }
    end)
  end
end
