defmodule Tergeo.Acceptance.GroupIndexTest do
  use TergeoWeb.AcceptanceCase

  alias Tergeo.{HomePage, GroupIndexPage}

  setup do
    Hound.start_session

    GroupIndexPage.visit
    HomePage.sign_test_user_in
    
    :ok
  end
    
  test "a message is shown when I haven't added any groups yet" do
    assert GroupIndexPage.has_no_created_groups_message?()
  end

  test "a list of groups are displayed" do
    groups = insert_list(3, :group)
    
    assert GroupIndexPage.has_group?(groups |> Enum.at(0))
    assert GroupIndexPage.has_group?(groups |> Enum.at(1))
    assert GroupIndexPage.has_group?(groups |> Enum.at(2))
  end

end