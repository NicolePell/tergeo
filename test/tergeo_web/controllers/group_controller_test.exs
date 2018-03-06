defmodule Tergeo.GroupControllerTest do
  use TergeoWeb.ConnCase

  alias Tergeo.Groups.Group

  @valid_attrs %{name: "Gryffindor"}

  test "#new renders a group form" do
    conn = get build_conn(), group_path(build_conn(), :new)

    assert html_response(conn, 200) =~ "Start your new a group"
  end

  test "#create successfully creates a group and redirects to the dashboard for that group" do
    conn = post build_conn(), group_path(build_conn(), :create, group: @valid_attrs)
    group = Repo.get_by!(Group, @valid_attrs)
    
    assert redirected_to(conn) == group_path(conn, :show, group)
    assert group.name == "Gryffindor"
  end

  test "#show renders the group dashboard" do
    group = insert(:group)

    conn =
      build_conn()
      |> get(group_path(build_conn(), :show, group))

    assert html_response(conn, :ok) =~ ~r/#{group.name}/s
  end

end
