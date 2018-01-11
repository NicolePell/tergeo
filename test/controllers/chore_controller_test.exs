defmodule Tergeo.ChoreControllerTest do
  use TergeoWeb.ConnCase

  test "#index renders a list of chores" do
    chore = insert(:chore)
    
    conn = get build_conn(), chore_path(build_conn(), :index)

    assert html_response(conn, 200) =~ "Your Chores List"
    assert html_response(conn, 200) =~ chore.description
  end
end
