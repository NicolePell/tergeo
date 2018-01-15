defmodule Tergeo.Acceptance.ChoreIndexTest do
  use TergeoWeb.AcceptanceCase

  test "View chores page" do
    navigate_to("/chores")

    find_element(:class, "chores-list")
  end

  test "Link to add chores is shown when no chores have been added" do
    navigate_to("/chores")

    find_element(:class, "chores-list__add-chore")
  end

  test "List of chores are displayed" do
    chores = insert_list(3, :chore)

    navigate_to("/chores")
    
    assert has_chore?(chores |> Enum.at(0))
    assert has_chore?(chores |> Enum.at(1))
    assert has_chore?(chores |> Enum.at(2))
  end

  defp has_chore?(chore) do
    find_element(:class, "chores-list__chore-#{chore.id}")
  end

end