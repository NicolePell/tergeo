defmodule Tergeo.HomeControllerTest do
  use TergeoWeb.ConnCase

  test "#index has a link to get started" do
    conn = get build_conn(), home_path(build_conn(), :index)

    assert html_response(conn, 200) =~ "Get Started"
  end
end
