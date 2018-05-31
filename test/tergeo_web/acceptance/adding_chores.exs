defmodule TergeoWeb.Acceptance.AddingChoresTest do
  use TergeoWeb.AcceptanceCase

  alias Tergeo.{HomePage, ChoreIndexPage, ChoreNewPage}

  setup do
    Hound.start_session
    Hound.Helpers.Cookie.delete_cookies()

    ChoreIndexPage.visit()     
    HomePage.sign_test_user_in()
    
    ChoreIndexPage.click_add_chore_button()

    :ok
  end
  
  test "successfully adding a chore with valid details" do
    ChoreNewPage.fill_in_form("Aqua Eructo!")
    ChoreNewPage.submit_form()

    assert_current_path(ChoreIndexPage.path())
    assert ChoreIndexPage.has_chore_description?("Aqua Eructo!") 
    refute ChoreIndexPage.has_chore_description?("Chore doesn't exist") 
    assert ChoreIndexPage.has_flash_message?("Your chore has been added successfully!")
  end

  test "shows validation messages for invalid details" do
    ChoreNewPage.submit_form()

    assert ChoreNewPage.has_help_block?("Description can't be blank")
    assert ChoreNewPage.has_flash_message?("Your chore could not be created, please fix the errors below")
  end

  test "selecting groups I belong to when adding a chore" do
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
