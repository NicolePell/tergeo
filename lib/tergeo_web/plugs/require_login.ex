defmodule TergeoWeb.Plugs.RequireLogin do
  import Plug.Conn
  import Phoenix.Controller

  def init(_params) do  
  end

  def call(conn, _opts) do
    if conn.assigns[:user] do
      conn
    else
      conn 
      |> redirect(to: "/auth/google?scope=email%20profile") 
      |> halt()
    end
  end

end