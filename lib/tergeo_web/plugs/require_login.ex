defmodule TergeoWeb.Plugs.RequireLogin do
  import Plug.Conn
  import Phoenix.Controller

  alias TergeoWeb.Router.Helpers

  def init(_params) do  
  end

  def call(conn, _opts) do
    if conn.assigns[:user] do
      conn
    else
      conn 
      |> redirect(to: Helpers.auth_path(conn, :request, "google", scope: "email profile")) 
      |> halt()
    end
  end

end