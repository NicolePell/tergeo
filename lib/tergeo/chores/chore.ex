defmodule Tergeo.Chores.Chore do
  use Ecto.Schema

  import Ecto.Changeset

  schema "chores" do
    field :description, :string

    timestamps()

    many_to_many :users, Tergeo.Users.User, join_through: "users_chores"
  end

  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:description])
    |> validate_required([:description])
  end

end