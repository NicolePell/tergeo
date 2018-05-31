defmodule Tergeo.Acceptance.ViewingGroupsTest do
  use TergeoWeb.AcceptanceCase

  alias Tergeo.GroupIndexPage

  setup do
    Hound.start_session

    GroupIndexPage.visit
    
    :ok
  end
    
  test "a message is shown when I haven't added any groups yet" do
    assert GroupIndexPage.has_no_created_groups_message?()
  end

  test "a list of groups I belong to are displayed" do
    groups = insert_list(3, :group)
    
    assert GroupIndexPage.has_group?(groups |> Enum.at(0))
    assert GroupIndexPage.has_group?(groups |> Enum.at(1))
    assert GroupIndexPage.has_group?(groups |> Enum.at(2))
  end

  test "groups I do not belong to are not displayed" do
    user = insert(:user)
    my_group = insert(:group, owner: user)

    other_user = insert(:user)
    other_group = insert(:group, owner: other_user)
    
    assert GroupIndexPage.has_group?(my_group)
    refute GroupIndexPage.has_group?(other_group)
  end

end