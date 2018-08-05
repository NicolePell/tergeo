defmodule Tergeo.GroupViewTest do
  use TergeoWeb.ConnCase, async: true
  import Phoenix.View

  alias Tergeo.Groups.Group

  test "renders new.html" do 
    changeset = Group.changeset(%Group{})
    content = render_to_string(TergeoWeb.GroupView, "new.html", conn: build_conn(), changeset: changeset)

    assert String.contains?(content, "Start your new group")
    assert String.contains?(content, "name")
  end

  test "renders show.html" do 
    group = insert(:group)
    group_chores = insert_list(3, :chore)

    content = render_to_string(
      TergeoWeb.GroupView,
      "show.html",
      conn: build_conn(),
      group: group,
      group_chores: group_chores
    )

    assert String.contains?(content, group.name)
    assert String.contains?(content, List.first(group_chores).description)
  end

end