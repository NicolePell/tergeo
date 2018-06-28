defmodule Tergeo.Users.User do
  use Ecto.Schema

  import Ecto.Changeset

  alias Tergeo.Users.User

  schema "users" do
    field :email, :string
    field :first_name, :string
    field :last_name, :string
    field :provider, :string
    field :token, :string

    timestamps()

    has_many :created_groups, Tergeo.Groups.Group, foreign_key: :owner_id
  end

  def changeset(%User{} = user, attrs) do
    user
    |> cast(attrs, [:first_name, :last_name, :email, :provider, :token])
    |> validate_required([:first_name, :last_name, :email, :provider, :token])
  end
end
