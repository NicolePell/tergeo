defmodule Tergeo.Repo.Migrations.AddUserIdToTopics do
  use Ecto.Migration

  def change do
    alter table(:chores) do
      add :user_id, references(:users)
    end
  end

end
