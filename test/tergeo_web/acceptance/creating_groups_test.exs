defmodule Tergeo.Acceptance.CreatingGroupsTest do
    use TergeoWeb.AcceptanceCase
  
    alias Tergeo.{GroupNewPage, GroupShowPage}

    test "when I submit a valid group form I am redirected to my group dashboard where I see my new group" do
      GroupNewPage.visit()
  
      GroupNewPage.fill_in_form("Gryffindor")
      GroupNewPage.submit_form()
  
      assert GroupShowPage.has_group_name?("Gryffindor") 
      assert GroupShowPage.has_flash_message?("Your group has been added!")
    end
    
  end
  