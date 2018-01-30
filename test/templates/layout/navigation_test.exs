defmodule TergeoWeb.NavigationTest do
  use TergeoWeb.ConnCase

  @tag :current
  test "shows a 'Sign in with Google' link when not signed in" do
    conn = get build_conn(), "/"

    assert html_response(conn, 200) =~ "Sign in with Google"
  end
end