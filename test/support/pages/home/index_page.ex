defmodule Tergeo.HomePage do
  use Tergeo.PageHelpers

  def visit() do
    navigate_to("/")
  end

  def has_welcome_message?(message) do
    message_element = find_element(:class, "nav__welcome-message")

    visible_text(message_element) == message
  end

  def click_sign_in_with_google_link() do
    find_element(:class, "google-sign-in__link")
    |> click
  end

  def sign_test_user_in() do
    username = System.get_env("TERGEO_TEST_USERNAME")
    password = System.get_env("TERGEO_TEST_USERPASS")

    fill_in_google_username(username)
    fill_in_google_password(password)
  end

  defp fill_in_google_username(username) do
    fill_field({:name, "identifier"}, username)

    click({:id, "identifierNext"})
  end

  defp fill_in_google_password(password) do
    fill_field({:name, "password"}, password)

    click({:id, "passwordNext"})
  end

end
