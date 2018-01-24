defmodule TergeoWeb.Chore do
  use TergeoWeb.Web, :model

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