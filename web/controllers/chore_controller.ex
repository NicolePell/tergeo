defmodule Tergeo.ChoreController do
  use Tergeo.Web, :controller

  alias Tergeo.Chore

  def index(conn, _params) do
    chores = Repo.all(Chore)
    render conn, "index.html", chores: chores
  end

end
