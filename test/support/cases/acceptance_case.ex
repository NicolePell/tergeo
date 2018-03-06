defmodule TergeoWeb.AcceptanceCase do
  @moduledoc """
  This module defines the test case to be used when writing tests that interact with the browser.
  """

  use ExUnit.CaseTemplate

  using do
    quote do
      @moduletag :acceptance

      use Phoenix.ConnTest

      alias Tergeo.Repo

      import Ecto
      import Ecto.Changeset
      import Ecto.Query
      
      import TergeoWeb.Router.Helpers

      @endpoint TergeoWeb.Endpoint

      use Hound.Helpers
      hound_session()

      import Tergeo.FactoryHelpers

      defmacro assert_current_path(assertion) do
        quote do
          expected_path = unquote(assertion)
          assert(
            current_path() == expected_path,
            "Incorrect path, expected \"#{current_path()}\" to be \"#{expected_path}\""
          )
        end
      end

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
