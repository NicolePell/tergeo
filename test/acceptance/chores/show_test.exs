defmodule Tergeo.Acceptance.ChoreShowTest do
  use TergeoWeb.AcceptanceCase

  alias Tergeo.{ChoreIndexPage, ChoreShowPage}

  test "navigating to a chore shows further details" do
    chore = insert(:chore)

    ChoreIndexPage.visit()
    ChoreIndexPage.view_chore(chore)
    
    assert ChoreShowPage.current_page?(chore)
    assert ChoreShowPage.has_chore_description?(chore)
  end
  
end
