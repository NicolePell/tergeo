defmodule TergeoWeb.HomeController do
  use TergeoWeb.Web, :controller

  def index(conn, _params) do
    render conn, "index.html"
  end

end