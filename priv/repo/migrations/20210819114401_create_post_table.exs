defmodule ThathaBlog.Repo.Migrations.CreatePostTable do
  use Ecto.Migration

  def change do
    create table :posts do
      add :title, :string
      add :content, :string
      add :user_id, references(:users, type: :binary_id)

      timestamps()
    end

  end

end
