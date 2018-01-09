defmodule Tergeo.Acceptance.IndexTest do
  use TergeoWeb.AcceptanceCase

  test "View chores page" do
    navigate_to("/chores")
    find_element(:class, "chores-list")
  end

  test "Link to add chores is shown when no chores have been added" do
    navigate_to("/chores")
    find_element(:class, "add__chore")
  end

end
