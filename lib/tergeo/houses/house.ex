defmodule Tergeo.Houses.House do
  use Ecto.Schema
  import Ecto.Changeset
  alias Tergeo.Houses.House


  schema "houses" do
    field :name, :string

    timestamps()
  end

  @doc false
  def changeset(%House{} = house, attrs) do
    house
    |> cast(attrs, [:name])
    |> validate_required([:name])
  end
end
