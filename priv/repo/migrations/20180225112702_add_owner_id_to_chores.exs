defmodule Tergeo.Repo.Migrations.AddUserIdToChores do
  use Ecto.Migration

  def change do
    alter table(:chores) do
      add :owner_id, references(:users)
    end
  end

end
