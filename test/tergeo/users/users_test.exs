defmodule Tergeo.UserTest do
  use Tergeo.DataCase

  import Tergeo.FactoryHelpers

  alias Tergeo.Users
  alias Tergeo.Users.User

  @valid_attrs %{ 
    first_name: "Severus", 
    last_name: "Snape", 
    email: "half-blood@prince.com", 
    provider: "google", 
    token: "Liberacorpus14h00h" 
  }
  @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = User.changeset(%User{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = User.changeset(%User{}, @invalid_attrs)
    refute changeset.valid?
  end

  test "list_created_groups/1 returns all groups created by a given user" do
    user = insert(:user)
    group = insert(:group, owner: user)

    assert Users.list_created_groups!(user) == [group]
  end
end