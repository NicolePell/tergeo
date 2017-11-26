defmodule Tergeo.Repo.Migrations.CreateChores do
  use Ecto.Migration

  def change do
    create table(:chores) do
      add :description, :string

      timestamps()
    end
  end

end
