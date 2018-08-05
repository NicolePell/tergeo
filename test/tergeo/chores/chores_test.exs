defmodule Tergeo.ChoreTest do
  use Tergeo.DataCase

  import Tergeo.FactoryHelpers

  alias Tergeo.Chores
  alias Tergeo.Chores.Chore

  test "changeset with valid attributes" do
    group = insert(:group)

    changeset = Chore.changeset(%Chore{}, %{description: "Aqua Eructo", group_id: group.id})
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = Chore.changeset(%Chore{}, %{description: nil})
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

  test "create_chore/2 with valid data creates a chore" do
    group = insert(:group)

    assert {:ok, %Chore{} = chore} = Chores.create_chore(%{description: "Aqua Eructo", group_id: group.id})
    assert chore.description == "Aqua Eructo"
    assert chore.group_id == group.id
  end

  test "create_chore/2 with invalid data creates a chore" do
    assert {:error, %Ecto.Changeset{}} = Chores.create_chore(%{description: nil, group_id: nil})
  end

  test "update_chore/2 returns the updated chore with valid data" do
    chore = insert(:chore)
    assert chore.is_complete == false

    assert {:ok, %Chore{} = chore} = Chores.update_chore(chore, %{is_complete: true})
    assert chore.is_complete == true
  end

  test "update_chore/2 returns an error changeset with invalid data" do
    chore = insert(:chore)
    assert {:error, %Ecto.Changeset{}} = Chores.update_chore(chore, %{description: nil})
  end

end