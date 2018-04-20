defmodule Tergeo.Repo.Migrations.AddOwnerIdToGroups do
  use Ecto.Migration

  def change do
    alter table(:groups) do
      add :owner_id, references(:users)
    end
  end
end
