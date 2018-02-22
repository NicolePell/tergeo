defmodule Tergeo.Repo.Migrations.CreateUsersChores do
  use Ecto.Migration

  def change do
    create table(:users_chores) do
      add :user_id, references(:users)
      add :chore_id, references(:chores)

    end

    create unique_index(:users_chores, [:user_id, :chore_id])
  end
end
