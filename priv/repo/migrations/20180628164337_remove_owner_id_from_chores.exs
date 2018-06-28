defmodule Tergeo.Repo.Migrations.RemoveOwnerIdFromChores do
  use Ecto.Migration

  def change do
    alter table(:chores) do
      remove :owner_id
    end
  end
end
