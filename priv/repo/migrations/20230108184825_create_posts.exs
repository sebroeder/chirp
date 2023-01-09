defmodule Chirp.Repo.Migrations.CreatePosts do
  use Ecto.Migration

  def change do
    create table(:posts) do
      add :username, :string, null: false
      add :body, :string, null: false
      add :likes_count, :integer, null: false, default: 0
      add :reposts_count, :integer, null: false, default: 0

      timestamps()
    end
  end
end
