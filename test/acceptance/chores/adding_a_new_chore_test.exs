defmodule Tergeo.Acceptance.AddingANewChoreTest do
  use TergeoWeb.AcceptanceCase

  alias Tergeo.{HomePage, ChoreIndexPage, ChoreNewPage}

  @moduletag :pending

  setup do
    Hound.start_session
    Hound.Helpers.Cookie.delete_cookies()

    ChoreIndexPage.visit()     
    HomePage.sign_test_user_in()
    
    ChoreIndexPage.click_add_chore_button()

    :ok
  end

  test "when I click the add a chore button I am navigated to the new chore form" do
    assert_current_path(ChoreNewPage.path())
  end
  
  test "when I submit a valid a chore, I see my new chore displayed on the index page" do
    ChoreNewPage.fill_in_form("Aqua Eructo!")
    ChoreNewPage.submit_form()

    assert_current_path(ChoreIndexPage.path())
    assert ChoreIndexPage.has_chore_description?("Aqua Eructo!") 
    refute ChoreIndexPage.has_chore_description?("Chore doesn't exist") 
    assert ChoreIndexPage.has_flash_message?("Your chore has been added successfully!")
  end

  test "when I submit a chore without a description, I see validation messages" do
    ChoreNewPage.submit_form()

    assert ChoreNewPage.has_help_block?("Description can't be blank")
    assert ChoreNewPage.has_flash_message?("Your chore could not be created, please fix the errors below")
  end

  test "groups I belong to are shown as options in the new chore form" do
    user = insert(:user)
    group = insert(:group, user)

    other_user = insert(:user)
    other_group = insert(:group, other_user)

    assert ChoreIndexPage.has_group_name_in_drop_down?(group.name)
    refute ChoreIndexPage.has_group_name_in_drop_down?(other_group.name)
  end

  test "when I submit a chore without selecting a group, I see a validation message" do
    group = insert(:group)
    ChoreNewPage.fill_in_form("Accio", group)
    ChoreNewPage.submit_form()

    assert ChoreNewPage.has_help_block?("Gorup can't be blank")
    assert ChoreNewPage.has_flash_message?("Your chore could not be created, please fix the errors below")
  end
  
end
