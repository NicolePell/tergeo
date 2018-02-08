defmodule Tergeo.Chores.Chore do
  use Ecto.Schema
  import Ecto.Changeset
  alias Tergeo.Chores.Chore

  schema "chores" do
    field :description, :string

    timestamps()
  end

  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:description])
    |> validate_required([:description])
  end

end