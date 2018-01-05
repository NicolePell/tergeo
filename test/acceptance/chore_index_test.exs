defmodule Tergeo.Acceptance.IndexTest do
  use TergeoWeb.AcceptanceCase

  test "View chores page" do
    navigate_to("/chores")
    find_element(:class, "chores-list")
  end

end
