defmodule Tergeo.ChoreControllerTest do
  use Tergeo.ConnCase

  test "#index renders a list of chores", %{conn: conn} do
    chores = insert_list(5, :chore)
    
    get build_conn(), chore_path(build_conn(), :index)

    assert html_response(conn, 200) =~ "Your Chore List"
  end
end
