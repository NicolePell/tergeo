defmodule Tergeo.Repo.Migrations.DropUsersChoresTable do
  use Ecto.Migration

  def change do
    drop table(:users_chores)
  end
end
