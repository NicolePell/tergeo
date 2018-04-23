defmodule Tergeo.GroupShowPage do
  use Tergeo.PageHelpers

  def has_group_name?(name) do
    find_element(:class, "group-dashboard__group-name")
    |> visible_text == name
  end

  def has_flash_message?(message) do
    alert_message = find_element(:class, "alert-info")

    visible_text(alert_message) == message
  end

  def current_page?(group) do
    current_path() == "/groups/#{group.id}"
  end

end
