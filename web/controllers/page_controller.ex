defmodule Scourgify.PageController do
  use Scourgify.Web, :controller

  def index(conn, _params) do
    render conn, "index.html"
  end
end
