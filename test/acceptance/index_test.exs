defmodule Scourgify.Acceptance.IndexTest do
  use Scourgify.AcceptanceCase
  
  alias Scourgify.IndexPage
  
  test "View the list of chores" do
    chores = [
      %{id: 1, description: "Make bed"},
      %{id: 2, description: "Unpack dishwasher"},
      %{id: 3, description: "Hang up clothes"},
      %{id: 4, description: "Clean the floors"}
    ]

    navigate_to "/"

    assert has_chore?(chores |> Enum.at(0))
    assert has_chore?(chores |> Enum.at(1))
    assert has_chore?(chores |> Enum.at(2))
  end

  defp has_chore?(chore) do
    find_element(:class, "chore-#{chore.id}")
  end

end
