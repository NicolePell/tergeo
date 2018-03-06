defmodule Tergeo.ChoreControllerTest do
  use TergeoWeb.ConnCase

  alias Tergeo.Chores.Chore

  @valid_attrs %{description: "Aqua Eructo!"}
  @invalid_attrs %{}

  defp chore_count(query), do: Repo.one(from c in query, select: count(c.id))

  test "requires a logged in user on all chores pages" do
    chore = insert(:chore)

    Enum.each(
      [
        get(build_conn(), chore_path(build_conn(), :index)),
        get(build_conn(), chore_path(build_conn(), :new)),
        post(build_conn(), chore_path(build_conn(), :create), chore: @valid_attrs),
        get(build_conn(), chore_path(build_conn(), :show, chore)),
    ], fn conn ->
      assert html_response(conn, 302)
      assert conn.halted
    end)
  end

  test "#index renders a list of chores" do
    user = insert(:user)
    chore = insert(:chore)

    conn = 
      build_conn()
      |> assign(:user, user)
      |> get(chore_path(build_conn(), :index))

    assert html_response(conn, 200) =~ "Your Chores List"
    assert html_response(conn, 200) =~ chore.description
  end

  test "#new renders a chore form" do
    user = insert(:user)

    conn = 
      build_conn()
      |> assign(:user, user)
      |> get(chore_path(build_conn(), :new))

    assert html_response(conn, 200) =~ "Add a new chore"
  end

  test "#create successfully creates a chore and redirects" do
    user = insert(:user)

    conn = 
      build_conn()
      |> assign(:user, user)
      |> post(chore_path(build_conn(), :create), chore: @valid_attrs)

    assert redirected_to(conn) == chore_path(conn, :index)
    assert Repo.get_by!(Chore, @valid_attrs).description == "Aqua Eructo!"
  end

  test "#create returns user to new form and shows error message when description is blank" do
    user = insert(:user)
    
    count_before = chore_count(Chore)
    
    build_conn()
    |> assign(:user, user)
    |> post(chore_path(build_conn(), :create), chore: @invalid_attrs)
    
    assert chore_count(Chore) == count_before
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
