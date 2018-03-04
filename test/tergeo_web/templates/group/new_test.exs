defmodule TergeoWeb.GroupNewTest do
  use TergeoWeb.ConnCase

  @tag(:groups)
  test "shows a 'Start a group' form" do
    conn = build_conn()
    |> get("/groups/new")
    
    assert html_response(conn, 200) =~ "<form></form>"
  end
  
end