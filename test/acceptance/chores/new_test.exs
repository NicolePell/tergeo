defmodule Tergeo.Acceptance.ChoreNewTest do
  use TergeoWeb.AcceptanceCase

  alias Tergeo.ChoreIndexPage
  alias Tergeo.ChoreNewPage

  test "when I click the add a chore button I am navigated to the new chore form " do
    ChoreIndexPage.visit()
    ChoreIndexPage.click_add_chore_button()
    
    assert_current_path(ChoreNewPage.path())
  end
  
  test "when I submit a valid a chore, I see my new chore displayed on the index page" do
    ChoreIndexPage.visit()
    ChoreIndexPage.click_add_chore_button()

    ChoreNewPage.fill_in_form(description: "Aqua Eructo!")
    ChoreNewPage.submit_form()

    assert_current_path(ChoreIndexPage.path())
    assert ChoreIndexPage.has_chore_title?('Aqua Eructo!')
    assert ChoreIndexPage.has_flash_message?('Chore created successfully.')
  end
  
end


# test "redirects to show when data is valid", %{conn: conn} do
#   user = insert(:user)

#   conn = conn
#   |> assign(:user, user)
#   |> post(video_path(conn, :create), video: @create_attrs)

#   video = Video |> Ecto.Query.last |> Catcasts.Repo.one
#   assert redirected_to(conn) == video_path(conn, :show, video)
#   assert get_flash(conn, :info) == "Video created successfully."
# end