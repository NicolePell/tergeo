defmodule Tergeo.Repo.Migrations.RemoveUserIdFromChores do
  use Ecto.Migration

  def change do
    alter table(:chores) do
      remove :user_id
    end
  end
end
