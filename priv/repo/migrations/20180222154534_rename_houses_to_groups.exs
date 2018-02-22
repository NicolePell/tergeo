defmodule Tergeo.Repo.Migrations.RenameHousesToGroups do
  use Ecto.Migration

  def change do
    rename table(:houses), to: table(:groups)
  end
end
