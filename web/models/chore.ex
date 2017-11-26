defmodule Tergeo.Chore do
  use Tergeo.Web, :model

  schema "chores" do
    field :description, :string

    timestamps()
  end
end