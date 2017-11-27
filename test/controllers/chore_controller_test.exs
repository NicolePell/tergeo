defmodule Tergeo.ChoreControllerTest do
  use Tergeo.ConnCase

  test "#index renders a list of chores" do
    insert_list(5, :chore)
    
    conn = get build_conn(), chore_path(build_conn(), :index)

    assert html_response(conn, 200) =~ "Your Chores List"
  end
end
