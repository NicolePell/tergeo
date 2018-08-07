defmodule TergeoWeb.ChoreController do
  use TergeoWeb.Web, :controller

  alias Tergeo.Chores
  alias Tergeo.Chores.Chore
  alias Tergeo.Users

  def index(conn, _params) do
    chores = Chores.list_chores

    render conn, "index.html", chores: chores
  end

  def new(conn, _params) do
    changeset = Chore.changeset(%Chore{}, %{})
    user_groups = Users.list_created_groups!(conn.assigns.user)

    render conn, "new.html", changeset: changeset, user_groups: user_groups
  end

  def create(conn, %{"chore" => chore_params}) do
    user_groups = Users.list_created_groups!(conn.assigns.user)

    case Chores.create_chore(chore_params) do
      {:ok, _chore} -> 
        conn
        |> put_flash(:info, "Your chore has been added successfully!")
        |> redirect(to: chore_path(conn, :index))
      {:error, changeset} -> 
        conn
        |> put_flash(:error, "Your chore could not be created, please fix the errors below")
        |> render("new.html", changeset: changeset, user_groups: user_groups)
    end
  end

  def show(conn, %{"id" => id}) do
    chore = Chores.get_chore!(id)

    render conn, "show.html", chore: chore
  end

  def complete_chore(conn, %{"id" => id}) do
    chore = Chores.get_chore!(id)

    case Chores.update_chore(chore, %{is_complete: true}) do
      {:ok, chore} ->
        conn
        |> put_flash(:info, "You completed the chore: #{chore.description}")
        |> redirect(to: chore_path(conn, :index))
      {:error, _} ->
        conn
        |> put_flash(:info, "Error updating chore")
        |> redirect(to: chore_path(conn, :index))
    end

  end

end
