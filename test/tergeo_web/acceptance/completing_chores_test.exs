defmodule TergeoWeb.Acceptance.CompletingChoresTest do
  use TergeoWeb.AcceptanceCase

  alias Tergeo.ChoreIndexPage

  setup do

    :ok
  end

  test "mark chore as complete from the chore list" do
    insert(:chore)
    ChoreIndexPage.visit()

    [chore | _rest] = find_all_elements(:class, "collection-item")

    old_message = find_within_element(chore, :class, "chores-list__completed")
    |> visible_text
    assert old_message == "Done? false"

    find_within_element(chore, :class, "chores-list__mark-done")
    |> click

    message = find_element(:css, ".alert")
              |> visible_text
    assert message  =~ "You completed the chore"
  end

  test "mark chore as complete from inside the chore page" do
    chore = insert(:chore)
    ChoreIndexPage.visit()
    ChoreIndexPage.view_chore(chore)

    find_within_element(chore, :class, "chores-list__mark-done")
    |> click

    message = find_element(:css, ".alert")
              |> visible_text

    assert message  =~ "Chore updated: #{chore.description}"
  end

end
