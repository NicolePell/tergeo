defmodule Tergeo.ChoreControllerTest do
  use TergeoWeb.ConnCase

  alias Tergeo.Chores.Chore

  defp chore_count(query), do: Repo.one(from c in query, select: count(c.id))

  test "requires a logged in user on all chores pages" do
    chore = insert(:chore)

    Enum.each(
      [
        get(build_conn(), chore_path(build_conn(), :index)),
        get(build_conn(), chore_path(build_conn(), :new)),
        post(build_conn(), chore_path(build_conn(), :create), chore: %{description: "Aqua Eructo!"}),
        get(build_conn(), chore_path(build_conn(), :show, chore)),
    ], fn conn ->
      assert html_response(conn, 302)
      assert conn.halted
    end)
  end

  test "#index renders a list" do
    user = insert(:user)
    chore = insert(:chore)

    conn =
      build_conn()
      |> assign(:user, user)
      |> get(chore_path(build_conn(), :index))

    assert html_response(conn, 200) =~ chore.description
  end

  test "chores list shows which group each chore belongs to" do
    group = insert(:group)
    chore = insert(:chore, group: group)

    conn =
      build_conn()
      |> assign(:user, insert(:user))
      |> get(chore_path(build_conn(), :index))

    assert html_response(conn, 200) =~ chore.group.name
  end

  test "#new renders a chore form" do
    user = insert(:user)

    conn =
      build_conn()
      |> assign(:user, user)
      |> get(chore_path(build_conn(), :new))

    assert html_response(conn, 200) =~ "Add a chore"
  end

  test "#create successfully creates a chore with valid attributes and redirects" do
    user = insert(:user)
    group = insert(:group, owner: user)

    count_before = chore_count(Chore)

    conn =
      build_conn()
      |> assign(:user, insert(:user))
      |> post(
           chore_path(build_conn(), :create),
           chore: %{description: "Aqua Eructo!", group_id: group.id}
         )

    assert redirected_to(conn) == chore_path(conn, :index)
    assert chore_count(Chore) == count_before + 1
    assert get_flash(conn, :info) == "Your chore has been added successfully!"
    assert Repo.get_by!(Chore, %{description: "Aqua Eructo!"}).description == "Aqua Eructo!"
  end

  test "redirects user to new form and shows error message when description is blank" do
    user = insert(:user)

    count_before = chore_count(Chore)

    conn =
      build_conn()
      |> assign(:user, user)
      |> post(chore_path(build_conn(), :create), chore: %{})

    assert chore_count(Chore) == count_before
    assert html_response(conn, :ok) =~ "Your chore could not be created"
  end

  test "redirects user to new form and shows error message when group is not selected" do
    user = insert(:user)

    count_before = chore_count(Chore)

    conn =
      build_conn()
      |> assign(:user, user)
      |> post(chore_path(build_conn(), :create), chore: %{description: "Aqua Eructo!"})

    assert chore_count(Chore) == count_before
    assert html_response(conn, :ok) =~ "Your chore could not be created"
  end

  test "#show renders the chore details page" do
    user = insert(:user)
    chore = insert(:chore)

    conn =
    build_conn()
    |> assign(:user, user)
    |> get(chore_path(build_conn(), :show, chore))

    assert html_response(conn, :ok) =~ ~r/#{chore.description}/s
  end
end
