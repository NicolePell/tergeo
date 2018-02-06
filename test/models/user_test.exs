defmodule Tergeo.UserTest do
  use Tergeo.DataCase

  alias Tergeo.User

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
end