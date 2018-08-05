defmodule Tergeo.Chores.Chore do
  use Ecto.Schema

  import Ecto.Changeset

  schema "chores" do
    field :description, :string
    field :is_complete, :boolean, default: false

    belongs_to :group, Tergeo.Groups.Group, foreign_key: :group_id

    timestamps()
  end

  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:description, :is_complete, :group_id])
    |> validate_required([:description, :group_id])
  end

end
