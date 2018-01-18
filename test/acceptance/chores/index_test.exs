defmodule Tergeo.Acceptance.ChoreIndexTest do
  use TergeoWeb.AcceptanceCase

  alias Tergeo.ChoreIndexPage

  test "A message is shown when I haven't added any chores yet" do
    ChoreIndexPage.visit()

    assert ChoreIndexPage.has_no_chores_message?()
  end

  test "List of chores are displayed" do
    chores = insert_list(3, :chore)

    ChoreIndexPage.visit()
    
    assert ChoreIndexPage.has_chore?(chores |> Enum.at(0))
    assert ChoreIndexPage.has_chore?(chores |> Enum.at(1))
    assert ChoreIndexPage.has_chore?(chores |> Enum.at(2))
  end

end