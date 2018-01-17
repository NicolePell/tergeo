defmodule Tergeo.Acceptance.ChoreIndexTest do
  use TergeoWeb.AcceptanceCase

  test "View chores page" do
    navigate_to("/chores")

    find_element(:class, "chores-list")
  end

  test "A message is shown when I haven't added any chores yet" do
    navigate_to("/chores")

    find_element(:class, "chores-list__no-chores")
  end

  test "When I click the button to add a new chore, I am takent to the new chore form" do
    navigate_to("/chores")
    add_chore_button = find_element(:class, "chores-list__add-chore")

    click(add_chore_button)

    assert current_path() == "/chores/new"
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