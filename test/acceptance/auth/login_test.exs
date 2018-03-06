defmodule Tergeo.Acceptance.LoginTest do
  use TergeoWeb.AcceptanceCase

  alias Tergeo.HomePage
  
  test "a user can sign in" do
    HomePage.visit()
    HomePage.click_sign_in_with_google_link()
    HomePage.sign_test_user_in()

    assert HomePage.has_welcome_message?("Welcome Tergeo!") 
  end

end
