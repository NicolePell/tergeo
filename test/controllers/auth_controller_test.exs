defmodule Tergeo.AuthControllerTest do
  use TergeoWeb.ConnCase

  @tag :current
  test "redirects user to Google for authentication" do
    conn = get build_conn(), "/auth/google?scope=email%20profile"
    assert redirected_to(conn, 302)
  end

end
