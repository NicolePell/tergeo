defmodule Tergeo.Acceptance.GroupDashboardTest do
  use TergeoWeb.AcceptanceCase

  alias Tergeo.{HomePage, GroupIndexPage}

  setup do
    Hound.start_session

    GroupIndexPage.visit
    HomePage.sign_test_user_in
    
    :ok
  end

  test "show group details" do
    group = insert(:group)
    GroupIndexPage.view_group(group)
    
    assert GroupShowPage.current_page?(group)
    assert GroupShowPage.has_group_name?(group.name)
  end

  test "show has an add chore button when I have no chores in my group" do
    group = insert(:group)
    GroupIndexPage.view_group(group)

    assert GroupShowPage.current_page?(group)

    no_chores_message = find_element(:class, "chores-list__no-chores")
                        |> visible_text()

    add_chore_button = find_element(:class, "chores-list__add-chore")
                        |> visible_text()

    assert no_chores_message  =~ "You haven't added any chores yet."
    assert add_chore_button  =~ "Add chore"
  end

end