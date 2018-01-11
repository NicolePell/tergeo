defmodule Tergeo.Factory do
  use ExMachina.Ecto, repo: Tergeo.Repo

  def chore_factory do
    %TergeoWeb.Chore{
      description: sequence("Cleanify")
    }
  end
end