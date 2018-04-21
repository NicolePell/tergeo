defmodule TergeoWeb.GroupController do
  use TergeoWeb.Web, :controller

  alias Tergeo.Groups
  alias Tergeo.Groups.Group

  def index(conn, _params) do
    created_groups = Groups.list_created_groups!(conn.assigns.user)
    
    render conn, "index.html", created_groups: created_groups
  end

  def new(conn, _params) do
    changeset = Group.changeset(%Group{}, %{})

    render conn, "new.html", changeset: changeset
  end

  def create(conn, %{"group" => group}) do
    case Groups.create_group(group) do
      {:ok, group} ->
        conn
        |> put_flash(:info, "Your group has been added!")
        |> redirect(to: group_path(conn, :show, group))
    end
  end

  def show(conn, %{"id" => id}) do
    group = Groups.get_group!(id)

    render conn, "show.html", group: group
  end

end
