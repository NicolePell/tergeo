defmodule Tergeo.Acceptance.ViewingChoreDetailsTest do
  use TergeoWeb.AcceptanceCase

  alias Tergeo.{ChoreIndexPage, ChoreShowPage, ChoreNewPage, HomePage}

  @moduletag :pending
  
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

  test "I see the name of the group the chore belongs to" do
    group = insert(:group)
    ChoreNewPage.fill_in_form("Accio", group)
    ChoreNewPage.submit_form()

    assert ChoreIndexPage.has_group_name?("#{group.name}") 
  end
  
end
