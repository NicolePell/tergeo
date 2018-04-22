defmodule Tergeo.GroupControllerTest do
  use TergeoWeb.ConnCase

  alias Tergeo.Groups.Group

  @valid_attrs %{name: "Gryffindor"}

  test "#new renders a group form" do
    conn = 
      build_conn()
      |> assign(:user, insert(:user))
      |> get(group_path(build_conn(), :new))

    assert html_response(conn, 200) =~ "Start your new group"
  end

  test "#create successfully creates a group and redirects to the dashboard for that group" do
    conn = 
      build_conn()
      |> assign(:user, insert(:user))
      |> post(group_path(build_conn(), :create, group: @valid_attrs))

    group = Repo.get_by!(Group, @valid_attrs)
    
    assert redirected_to(conn) == group_path(conn, :show, group)
    assert group.name == "Gryffindor"
  end

  test "#show renders the group dashboard" do
    group = insert(:group)
    user = insert(:user)

    conn =
      build_conn()
      |> assign(:user, user)
      |> get(group_path(build_conn(), :show, group))

    assert html_response(conn, :ok) =~ ~r/#{group.name}/s
  end

  test "#index renders a list of groups that the user has created" do
    user = insert(:user)
    group = insert(:group, owner: user)

    other_user = insert(:user)
    other_group = insert(:group, owner: other_user)

    conn =
      build_conn()
      |> assign(:user, user)
      |> get(group_path(build_conn(), :index))

    assert html_response(conn, 200) =~ "Your Groups"
    assert html_response(conn, 200) =~ group.name
    refute html_response(conn, 200) =~ other_group.name
  end

end
