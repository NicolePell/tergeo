defmodule Tergeo.Repo.Migrations.AddGroupIdToChores do
  use Ecto.Migration

  def change do
    alter table(:chores) do
      add :group_id, references(:groups)
    end
  end
end
