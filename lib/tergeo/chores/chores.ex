defmodule Tergeo.Chores do
  @moduledoc """
  The Chores context.
  """

  import Ecto.Query, warn: false
  alias Tergeo.Repo

  alias Tergeo.Chores.Chore

  @doc """
  Returns the list of chores.

  ## Examples

      iex> list_chores()
      [%Chore{}, ...]

  """
  def list_chores do
    Repo.all(Chore)
    |> Repo.preload(group: :owner)
  end

  @doc """
  Gets a single chore.

  Raises `Ecto.NoResultsError` if the Chore does not exist.

  ## Examples

      iex> get_chore!(123)
      %Chore{}

      iex> get_chore!(456)
      ** (Ecto.NoResultsError)

  """
  def get_chore!(id) do
    Repo.get!(Chore, id)
    |> Repo.preload(group: :owner)
  end

  @doc """
  Creates a chore.

  ## Examples

      iex> create_chore(%{field: value})
      {:ok, %Chore{}}

      iex> create_chore(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_chore(attrs \\ %{}) do
    %Chore{}
    |> Chore.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a chore.

  ## Examples

      iex> update_chore(chore, %{field: value})
      {:ok, %Chore{}}

      iex> update_chore(chore, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_chore(chore, attrs) do
    chore
    |> Chore.changeset(attrs)
    |> Repo.update
  end

end
