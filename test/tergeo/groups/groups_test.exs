defmodule Tergeo.GroupsTest do
  use Tergeo.DataCase

  import Tergeo.FactoryHelpers

  alias Tergeo.Groups
  alias Tergeo.Groups.Group

  describe "groups" do

    @valid_attrs %{name: "Gryffindor"}
    @invalid_attrs %{name: nil}

    test "get_group!/1 returns the group with given id" do
      group = insert(:group)

      assert Groups.get_group!(group.id) == group
    end

    test "create_group/2 with valid data creates a group" do
      user = insert(:user)

      assert {:ok, %Group{} = group} = Groups.create_group(user, @valid_attrs)
      assert group.name == "Gryffindor"
    end

    test "create_group/2 with invalid data returns error changeset" do
      user = insert(:user)

      assert {:error, %Ecto.Changeset{}} = Groups.create_group(user, @invalid_attrs)
    end

    test "list_created_groups/1 returns all groups created by a given user" do
      user = insert(:user)
      group = insert(:group, owner: user)

      assert Groups.list_created_groups!(user) == [group]
    end

  end
end
