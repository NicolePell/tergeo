defmodule TergeoWeb.Chore do
  use TergeoWeb.Web, :model

  schema "chores" do
    field :description, :string

    timestamps()
  end
end