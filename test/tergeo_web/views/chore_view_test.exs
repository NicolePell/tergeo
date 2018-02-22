defmodule Tergeo.ChoreViewTest do
  use TergeoWeb.ConnCase, async: true
  import Phoenix.View

  alias Tergeo.Chores.Chore

  test "renders new.html" do 
    changeset = Chore.changeset(%Chore{})
    content = render_to_string(TergeoWeb.ChoreView, "new.html", conn: build_conn(), changeset: changeset)

    assert String.contains?(content, "Add a new chore")
    assert String.contains?(content, "description")
  end

end