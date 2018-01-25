defmodule Tergeo.Acceptance.ChoreNewTest do
  use TergeoWeb.AcceptanceCase

  alias Tergeo.ChoreIndexPage
  alias Tergeo.ChoreNewPage

  test "when I click the add a chore button I am navigated to the new chore form " do
    ChoreIndexPage.visit()
    ChoreIndexPage.click_add_chore_button()
    
    assert_current_path(ChoreNewPage.path())
  end
  
  test "when I submit a valid a chore, I see my new chore displayed on the index page" do
    ChoreIndexPage.visit()
    ChoreIndexPage.click_add_chore_button()

    ChoreNewPage.fill_in_form("Aqua Eructo!")
    ChoreNewPage.submit_form()

    assert_current_path(ChoreIndexPage.path())
    assert ChoreIndexPage.has_chore_description?("Aqua Eructo!") 
    refute ChoreIndexPage.has_chore_description?("Chore doesn't exist") 
    assert ChoreIndexPage.has_flash_message?("Your chore has been added successfully!")
  end

  test "when I submit a chore without a description, I see a message that the description can't be blank" do
    ChoreIndexPage.visit()
    ChoreIndexPage.click_add_chore_button()

    ChoreNewPage.submit_form()

    assert ChoreNewPage.has_help_block?("Description can't be blank")
  end
  
end
