defmodule Tergeo.ChoreViewTest do
  use TergeoWeb.ConnCase, async: true
  import Phoenix.View

  alias Tergeo.Chores.Chore

  test "renders new.html" do
    user_groups = insert_list(3, :group)
    changeset = Chore.changeset(%Chore{})

    content = render_to_string(
      TergeoWeb.ChoreView,
      "new.html",
      conn: build_conn(),
      changeset: changeset,
      user_groups: user_groups
    )

    assert String.contains?(content, "Add a chore")
    assert String.contains?(content, "description")
    assert String.contains?(content, "Select a group")
  end

end