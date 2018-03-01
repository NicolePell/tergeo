defmodule TergeoWeb.Plugs.RequireLoginTest do
  use TergeoWeb.ConnCase

  test "the user is redirected when user is not assigned to the connection" do
    conn = build_conn() |> TergeoWeb.Plugs.RequireLogin.call(%{})

    assert redirected_to(conn) == "/auth/google?scope=email%20profile"
  end

  test "the user passes through when assigned to the connection" do
    conn = build_conn()
    |> assign(:user, %Tergeo.Users.User{})
    |> TergeoWeb.Plugs.RequireLogin.call(%{})
    
    assert conn.status != 302
  end

end