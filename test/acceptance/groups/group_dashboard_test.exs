defmodule Tergeo.Acceptance.GroupDashboardTest do
  use TergeoWeb.AcceptanceCase

  alias Tergeo.{HomePage, GroupIndexPage}

  @moduletag :pending

  setup do
    Hound.start_session

    GroupIndexPage.visit
    HomePage.sign_test_user_in
    
    :ok
  end

  test "navigating to group dashboard shows further details" do
    group = insert(:group)
    GroupIndexPage.view_group(group)
    
    assert GroupShowPage.current_page?(group)
    assert GroupShowPage.has_group_name?(group.name)
  end

end