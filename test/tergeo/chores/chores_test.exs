defmodule Tergeo.ChoreTest do
  use Tergeo.DataCase

  import Tergeo.FactoryHelpers

  alias Tergeo.Chores
  alias Tergeo.Chores.Chore

  @valid_attrs %{description: "Aqua Eructo"}
  @invalid_attrs %{description: nil}

  test "changeset with valid attributes" do
    changeset = Chore.changeset(%Chore{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = Chore.changeset(%Chore{}, @invalid_attrs)
    refute changeset.valid?
  end

  test "list_chores/0 returns all chores" do
    chore = insert(:chore)
    assert Chores.list_chores() == [chore]  
  end

  test "get_chore!/1 returns the chore with given id" do
    chore = insert(:chore)
    assert Chores.get_chore!(chore.id) == chore
  end

  test "create_chore/1 with valid data creates a chore" do
    assert {:ok, %Chore{} = chore} = Chores.create_chore(@valid_attrs)
    assert chore.description == "Aqua Eructo"
  end

  test "create_chore/1 with invalid data returns error changeset" do
    assert {:error, %Ecto.Changeset{}} = Chores.create_chore(@invalid_attrs)
  end

  test "update_chore/2 returns the updated chore with valid data" do
    chore = insert(:chore)
    assert chore.is_complete == false

    assert {:ok, %Chore{} = chore} = Chores.update_chore(chore, %{is_complete: true})
    assert chore.is_complete == true
  end

  test "update_chore/2 returns an error changeset with invalid data" do
    chore = insert(:chore)
    assert {:error, %Ecto.Changeset{}} = Chores.update_chore(chore, @invalid_attrs)
  end

end