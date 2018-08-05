defmodule Tergeo.HomeControllerTest do
  use TergeoWeb.ConnCase

  test "#index has a link to start a new group when the user hasn't signed in" do
    conn = get build_conn(), group_path(build_conn(), :index)

    assert html_response(conn, 200) =~ "You haven't created any groups yet."
    assert html_response(conn, 200) =~ "Start a group now..."
  end

end
