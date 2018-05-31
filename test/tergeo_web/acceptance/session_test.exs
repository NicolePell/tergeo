defmodule Tergeo.Acceptance.SessionTest do
  use TergeoWeb.AcceptanceCase

  alias Tergeo.HomePage

  test "a user can sign in" do
    HomePage.visit()
    HomePage.click_sign_in_with_google_link()
    HomePage.sign_test_user_in()

    assert HomePage.has_welcome_message?("Welcome Tergeo!") 
  end
  
  test "a user can sign out" do
    HomePage.visit()
    HomePage.click_sign_in_with_google_link()
    HomePage.sign_test_user_in()
    assert HomePage.has_welcome_message?("Welcome Tergeo!") 
    
    HomePage.click_sign_out_with_google_link()
    assert HomePage.has_message_to_get_started?("Sign in to get started!") 
  end

end
