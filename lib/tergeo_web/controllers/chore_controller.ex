defmodule TergeoWeb.ChoreController do
  use TergeoWeb.Web, :controller

  alias TergeoWeb.Chore

  def index(conn, _params) do
    chores = Repo.all(Chore)
    render conn, "index.html", chores: chores
  end

  def new(conn, _params) do
    changeset = Chore.changeset(%Chore{}, %{})

    render conn, "new.html", changeset: changeset
  end

end
