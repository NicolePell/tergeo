defmodule Tergeo.Users do
  @moduledoc """
  The Users context.
  """

  import Ecto.Query, warn: false

  alias Tergeo.Repo
  alias Tergeo.Users.User

  @doc """
  Returns the list of groups for a given user.

  ## Examples

      iex> list_created_groups!(123)
      [%Group{}, ...]

  """
  def list_created_groups!(user) do
    user
    |> Ecto.assoc(:created_groups)
    |> Repo.all()
    |> Repo.preload(:owner)
  end

end
