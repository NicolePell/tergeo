defmodule Tergeo.ChoreTest do
  use Tergeo.ModelCase

  alias TergeoWeb.Chore

  @valid_attrs %{description: "Aqua Eructo"}
  @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = Chore.changeset(%Chore{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = Chore.changeset(%Chore{}, @invalid_attrs)
    refute changeset.valid?
  end
end