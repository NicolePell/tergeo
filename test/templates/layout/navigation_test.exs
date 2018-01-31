defmodule TergeoWeb.NavigationTest do
  use TergeoWeb.ConnCase

  test "shows a 'Sign in with Google' link when not signed in" do
    conn = get build_conn(), "/"

    assert html_response(conn, 200) =~ "Sign in with Google"
  end

  test "shows a link to the chores index when the user is signed in" do
    user = insert(:user)

    conn = build_conn()
    |> assign(:user, user)
    |> get("/")

    assert html_response(conn, 200) =~ "<a href=\"/chores\">Chores</a>"
  end

  test "shows a link to add a new chore when the user is signed in" do
    user = insert(:user)

    conn = build_conn()
    |> assign(:user, user)
    |> get("/")
    
    assert html_response(conn, 200) =~ "<a href=\"/chores/new\">Add chore</a>"
  end
  
  @tag :current
  test "shows a sign out link when the user has already authenticated" do
    user = insert(:user)

    conn = build_conn()
    |> assign(:user, user)
    |> get("/")

    assert html_response(conn, 200) =~ "Sign out"
  end
  
end