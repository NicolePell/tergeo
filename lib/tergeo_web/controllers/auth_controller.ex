defmodule TergeoWeb.AuthController do
  use TergeoWeb.Web, :controller

  plug Ueberauth

  alias Tergeo.User
  alias Tergeo.Repo

  def new(%{assigns: %{ueberauth_auth: auth}} = conn, _params) do
    user_params = %{
      token: auth.credentials.token, 
      first_name: auth.info.first_name,
      last_name: auth.info.last_name,
      email: auth.info.email,
      provider: "google"
    }

    changeset = User.changeset(%User{}, user_params)

    create(conn, changeset)
  end

  def create(conn, changeset) do
    case insert_or_update_user(changeset) do 
      {:ok, user} ->
        conn
        |> put_flash(:info, "You have successfully signed in!")
        |> put_session(:user_id, user.id)
        |> redirect(to: chore_path(conn, :index))
      {:error, _reason} ->
        conn
        |> put_flash(:error, "There was error attempting to sign you in.")
        |> redirect(to: home_path(conn, :index))
    end
  end

  def delete(conn, _params) do
    conn
    |> configure_session(drop: true)
    |> redirect(to: home_path(conn, :index))
  end

  defp insert_or_update_user(changeset) do
    case Repo.get_by(User, email: changeset.changes.email) do
      nil ->
        Repo.insert(changeset)
      user ->
        {:ok, user}
    end
  end
  
end