defmodule Tergeo.PageController do
  use Tergeo.Web, :controller

  def index(conn, _params) do
    render conn, "index.html"
  end
end
