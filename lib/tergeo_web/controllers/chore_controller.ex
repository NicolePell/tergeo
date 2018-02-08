defmodule TergeoWeb.ChoreController do
  use TergeoWeb.Web, :controller

  alias Tergeo.Chores.Chore

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
    
    case Repo.insert(changeset) do
      {:ok, _chore} -> 
        conn
        |> put_flash(:info, "Your chore has been added successfully!")
        |> redirect(to: chore_path(conn, :index))
      {:error, changeset} -> 
        conn
        |> put_flash(:error, "Your chore could not be created, please fix the errors below")
        |> render("new.html", changeset: changeset)
    end

  end

  def show(conn, %{"id" => id}) do
    chore = Repo.get!(Chore, id)

    render conn, "show.html", chore: chore
  end

end
