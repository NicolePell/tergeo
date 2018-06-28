defmodule Tergeo.Repo.Migrations.RemoveIsSeasonalFromChores do
  use Ecto.Migration

  def change do
    alter table(:chores) do
      remove :is_seasonal
    end
  end
end
