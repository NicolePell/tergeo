defmodule TergeoWeb.NavigationTest do
  use TergeoWeb.ConnCase

  test "shows a 'Sign in with Google' link when not signed in" do
    conn = get build_conn(), "/"

    assert html_response(conn, 200) =~ "Sign in with Google"
  end

  @tag :current
  test "shows a link to the chores index" do
    conn = get build_conn(), "/"

    assert html_response(conn, 200) =~ "<a href=\"/chores\">Chores</a>"
  end
  
end