defmodule TergeoWeb.GroupController do
  use TergeoWeb.Web, :controller

  alias Tergeo.Groups
  alias Tergeo.Groups.Group

  def new(conn, _params) do

    render conn, "new.html"
  end

end
