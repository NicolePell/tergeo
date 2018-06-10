defmodule Tergeo.Chores.Chore do
  use Ecto.Schema

  import Ecto.Changeset

  schema "chores" do
    field :description, :string
    field :is_complete, :boolean, default: false

    timestamps()

    many_to_many :users, Tergeo.Users.User, join_through: "users_chores"
    belongs_to :owner, Tergeo.Users.User, foreign_key: :owner_id
  end

  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:description, :is_complete])
    |> validate_required([:description])
  end

end