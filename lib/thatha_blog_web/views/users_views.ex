defmodule ThathaBlogWeb.UsersView do
  def render("create.json", %{user: _user}) do
    %{
      Message: "User created"
    }
  end
end
