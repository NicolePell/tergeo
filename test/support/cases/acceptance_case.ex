defmodule Tergeo.AcceptanceCase do
  @moduledoc """
  This module defines the test case to be used when writing tests that interact with the browser.
  """

  use ExUnit.CaseTemplate

  using do
    quote do
      @moduletag :feature

      use Phoenix.ConnTest

      alias Tergeo.Repo

      import Ecto
      import Ecto.Changeset
      import Ecto.Query
      
      import Tergeo.Router.Helpers

      @endpoint Tergeo.Endpoint

      use Hound.Helpers
      hound_session()
    end
  end

  setup tags do
    :ok = Ecto.Adapters.SQL.Sandbox.checkout(Tergeo.Repo)

    unless tags[:async] do
      Ecto.Adapters.SQL.Sandbox.mode(Tergeo.Repo, {:shared, self()})
    end

    {:ok, conn: Phoenix.ConnTest.build_conn()}
  end

end
