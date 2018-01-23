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

  def create(conn, %{"chore" => chore}) do
    changeset = Chore.changeset(%Chore{}, chore)
    Repo.insert(changeset)

    conn
    |> put_flash(:info, "Your chore has been added successfully!")
    |> redirect(to: chore_path(conn, :index))
  end

end
