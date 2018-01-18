defmodule Tergeo.Acceptance.ChoreNewTest do
  use TergeoWeb.AcceptanceCase

  alias Tergeo.ChoreIndexPage
  alias Tergeo.ChoreNewPage

  test "When I click the button to add a new chore, I am taken to the new chore form" do
    ChoreIndexPage.visit
    ChoreIndexPage.add_chore_button()

    assert ChoreNewPage.current_page?()
  end
  
end