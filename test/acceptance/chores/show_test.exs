defmodule Tergeo.Acceptance.ChoreShowTest do
  use TergeoWeb.AcceptanceCase

  alias Tergeo.{ChoreIndexPage, ChoreShowPage, HomePage}

  setup do
    Hound.start_session

    ChoreIndexPage.visit()  
    HomePage.sign_test_user_in()
    
    :ok
  end
  
  test "navigating to a chore shows further details" do
    chore = insert(:chore)
    ChoreIndexPage.view_chore(chore)
    
    assert ChoreShowPage.current_page?(chore)
    assert ChoreShowPage.has_chore_description?(chore)
  end
  
end
