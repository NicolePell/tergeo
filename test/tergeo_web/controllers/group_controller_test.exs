defmodule Tergeo.GroupControllerTest do
  use TergeoWeb.ConnCase

  alias Tergeo.Groups.Group

  # @valid_attrs %{name: "Gryffindor"}
  # @invalid_attrs %{}

  @tag(:groups)
  test "#new renders a group form" do
    conn = get build_conn(), group_path(build_conn(), :new)

    assert html_response(conn, 200) =~ "Start a new a group"
  end

end
