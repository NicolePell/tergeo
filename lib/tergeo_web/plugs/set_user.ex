defmodule Tergeo.Plugs.SetUser do
  import Plug.Conn

  alias Tergeo.Repo
  alias Tergeo.Users.User

  def init(_params) do  
  end

  def call(conn, _opts) do
    if conn.assigns[:user] do
      conn
    else
      user_id = get_session(conn, :user_id)
      
      cond do
        user = user_id && Repo.get(User, user_id) ->
          assign(conn, :user, user)
        true ->
          assign(conn, :user, nil)
      end
    end
  end

end