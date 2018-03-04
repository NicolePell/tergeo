defmodule Tergeo.Acceptance.GroupNewTest do
    use TergeoWeb.AcceptanceCase
  
    alias Tergeo.GroupNewPage
    
    @tag(:groups)
    test "when I submit a valid a new group form, I see my new group dashboard" do
      GroupNewPage.visit()
  
      GroupNewPage.fill_in_form("Gryffindor")
      ChoreNewPage.submit_form()
  
      assert_current_path(GroupShowPage.path())
      assert GroupShowPage.has_group_name?("Gryffindor") 
      assert GroupShowPage.has_flash_message?("Your group has been added successfully!")
    end
    
  end
  