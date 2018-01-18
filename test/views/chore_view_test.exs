defmodule Tergeo.ChoreViewTest do
  use TergeoWeb.ConnCase, async: true
  import Phoenix.View

  alias TergeoWeb.Chore

  @tag :current
  test "renders new.html" do 
    changeset = Chore.changeset(%Chore{})
    content = render_to_string(TergeoWeb.ChoreView, "new.html", conn: conn(), changeset: changeset)

    assert String.contains?(content, "New chore")
    assert String.contains?(content, "description")
  end

end