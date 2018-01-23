defmodule Tergeo.ChoreControllerTest do
  use TergeoWeb.ConnCase

  alias TergeoWeb.Chore

  @valid_attrs %{description: "Aqua Eructo!"}

  test "#index renders a list of chores" do
    chore = insert(:chore)
    
    conn = get build_conn(), chore_path(build_conn(), :index)

    assert html_response(conn, 200) =~ "Your Chores List"
    assert html_response(conn, 200) =~ chore.description
  end

  test "#new renders a chore form" do
    conn = get build_conn(), chore_path(build_conn(), :new)

    assert html_response(conn, 200) =~ "Add a new chore"
  end

  test "#create successfully creates a chore and redirects" do
    conn = post build_conn(), chore_path(build_conn(), :create), chore: @valid_attrs

    assert redirected_to(conn) == chore_path(conn, :index)
    assert Repo.get_by!(Chore, @valid_attrs).description == "Aqua Eructo!"
  end
end
