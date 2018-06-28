defmodule Tergeo.Groups do
  @moduledoc """
  The Groups context.
  """

  import Ecto.Query, warn: false

  alias Tergeo.Repo

  alias Tergeo.Groups.Group

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

    # """
    # REVIEW: Have to run preload to make the test pass.
    # Fails with: #Ecto.Association.NotLoaded<association :owner is not loaded>
    # """
  end

  @doc """
  Gets a single group.

  Raises `Ecto.NoResultsError` if the Group does not exist.

  ## Examples

      iex> get_group!(123)
      %Group{}

      iex> get_group!(456)
      ** (Ecto.NoResultsError)

  """
  def get_group!(id) do
    Repo.get!(Group, id)
    |> Repo.preload(:owner)
  end

  @doc """
  Creates a group.

  ## Examples

      iex> create_group(%{field: value})
      {:ok, %Group{}}

      iex> create_group(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_group(user, group) do
    user
    |> Ecto.build_assoc(:created_groups)
    |> Group.changeset(group)
    |> Repo.insert()
  end
end
