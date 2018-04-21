defmodule Tergeo.GroupsTest do
  use Tergeo.DataCase

  import Tergeo.FactoryHelpers

  alias Tergeo.Groups
  alias Tergeo.Groups.Group

  @moduletag :pending
  describe "groups" do

    @valid_attrs %{name: "Gryffindor"}
    @update_attrs %{name: "Ravenclaw"}
    @invalid_attrs %{name: nil}

    test "list_groups/0 returns all groups" do
      group = insert(:group)
      assert Groups.list_groups() == [group]
    end

    test "get_group!/1 returns the group with given id" do
      group = insert(:group)
      assert Groups.get_group!(group.id) == group
    end

    test "create_group/1 with valid data creates a group" do
      assert {:ok, %Group{} = group} = Groups.create_group(@valid_attrs)
      assert group.name == "Gryffindor"
    end

    test "create_group/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Groups.create_group(@invalid_attrs)
    end

    test "update_group/2 with valid data updates the group" do
      group = insert(:group)
      assert {:ok, group} = Groups.update_group(group, @update_attrs)
      assert %Group{} = group
      assert group.name == "Ravenclaw"
    end

    test "update_group/2 with invalid data returns error changeset" do
      group = insert(:group)
      assert {:error, %Ecto.Changeset{}} = Groups.update_group(group, @invalid_attrs)
      assert group == Groups.get_group!(group.id)
    end

    test "delete_group/1 deletes the group" do
      group = insert(:group)
      assert {:ok, %Group{}} = Groups.delete_group(group)
      assert_raise Ecto.NoResultsError, fn -> Groups.get_group!(group.id) end
    end

    test "change_group/1 returns a group changeset" do
      group = insert(:group)
      assert %Ecto.Changeset{} = Groups.change_group(group)
    end

    test "list_created_groups/1 returns all groups created by a given user" do
      owner = insert(:user)
      group = insert(:group, owner: owner)

      assert Groups.list_created_groups(owner) == [group]
    end

  end
end
