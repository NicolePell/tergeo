defmodule Tergeo.FactoryHelpers do
  use ExMachina.Ecto, repo: Tergeo.Repo

  use Tergeo.Factory.Chore
  use Tergeo.Factory.User
  use Tergeo.Factory.Group
  
end