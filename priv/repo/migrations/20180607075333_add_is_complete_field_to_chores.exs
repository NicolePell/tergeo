defmodule Tergeo.Repo.Migrations.AddIsCompleteFieldToChores do
  use Ecto.Migration

  def change do
    alter table(:chores) do
      add :is_complete, :boolean, default: false
    end
  end
end
