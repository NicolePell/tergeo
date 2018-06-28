defmodule Tergeo.Chores.Chore do
  use Ecto.Schema

  import Ecto.Changeset

  schema "chores" do
    field :description, :string
    field :is_complete, :boolean, default: false

    timestamps()
  end

  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:description, :is_complete])
    |> validate_required([:description])
  end

end
