defmodule Tergeo.AuthControllerTest do
  use TergeoWeb.ConnCase

  @ueberauth_auth %{credentials: %{token: "Liberacorpus14h00h"},
                    info: %{email: "half-blood@prince.com", first_name: "Severus", last_name: "Snape"},
                    provider: :google}

  test "#request redirects user to Google for authentication" do
    conn = get build_conn(), "/auth/google?scope=email%20profile"
    assert redirected_to(conn, 302)
  end
  
  test "#new successfuly creates a user from Google information" do
    build_conn()
    |> assign(:ueberauth_auth, @ueberauth_auth)
    |> get("/auth/google/callback")
  end

  @tag :current
  test "#delete signs the user out by dropping them from the session" do
    user = insert(:user)

    conn = build_conn()
    |> assign(:user, user)
    |> get("/auth/signout")
    |> get("/")

    assert conn.assigns.user == nil
  end

end
