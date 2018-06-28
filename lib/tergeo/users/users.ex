defmodule Tergeo.Users do
  @moduledoc """
  The Users context.
  """

  import Ecto.Query, warn: false

  alias Tergeo.Repo
  alias Tergeo.Users.User

  @doc """
  Returns the list of users.

  ## Examples

      iex> list_users()
      [%User{}, ...]

  """
  def list_users do
    Repo.all(User)
  end

  @doc """
  Gets a single user.

  Raises `Ecto.NoResultsError` if the User does not exist.

  ## Examples

      iex> get_user!(123)
      %User{}

      iex> get_user!(456)
      ** (Ecto.NoResultsError)

  """
  def get_user!(id), do: Repo.get!(User, id)

  @doc """
  Creates a user.

  ## Examples

      iex> create_user(%{field: value})
      {:ok, %User{}}

      iex> create_user(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_user(attrs \\ %{}) do
    %User{}
    |> User.changeset(attrs)
    |> Repo.insert()
  end

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
  
end
