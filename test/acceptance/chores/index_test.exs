defmodule Tergeo.Acceptance.ChoreIndexTest do
  use TergeoWeb.AcceptanceCase

  alias Tergeo.{HomePage, ChoreIndexPage}

  setup do
    Hound.start_session

    ChoreIndexPage.visit()
    HomePage.sign_test_user_in()
    
    :ok
  end
    
  test "a message is shown when I haven't added any chores yet" do
    assert ChoreIndexPage.has_no_chores_message?()
  end

  test "a list of chores are displayed" do
    chores = insert_list(3, :chore)
    
    assert ChoreIndexPage.has_chore?(chores |> Enum.at(0))
    assert ChoreIndexPage.has_chore?(chores |> Enum.at(1))
    assert ChoreIndexPage.has_chore?(chores |> Enum.at(2))
  end

end