defmodule Tergeo.Groups do
  @moduledoc """
  The Groups context.
  """

  import Ecto.Query, warn: false

  alias Tergeo.Repo
  alias Tergeo.Groups.Group

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

  @doc """
  Returns the list of chores for a given group.

  ## Examples

      iex> get_chores!(123)
      [%Group{}, ...]

  """
  def get_chores(group) do
    group
    |> Ecto.assoc(:chores)
    |> Repo.all()
    |> Repo.preload(group: :owner)
  end

end
