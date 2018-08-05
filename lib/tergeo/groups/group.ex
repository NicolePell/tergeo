defmodule Tergeo.Groups.Group do
  use Ecto.Schema
  
  import Ecto.Changeset
  
  alias Tergeo.Groups.Group

  schema "groups" do
    field :name, :string

    timestamps()

    belongs_to :owner, Tergeo.Users.User, foreign_key: :owner_id
    has_many :chores, Tergeo.Chores.Chore
  end

  @doc false
  def changeset(%Group{} = group, attrs \\ %{}) do
    group
    |> cast(attrs, [:name])
    |> validate_required([:name])
  end
end
