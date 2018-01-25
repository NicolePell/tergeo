defmodule Tergeo.ChoreIndexPage do
  use Tergeo.PageHelpers

  def path() do
    "/chores"
  end
  
  def visit do
    navigate_to("/chores")
  end

  def click_add_chore_button() do
    find_element(:class, "chores-list__add-chore")
    |> click
  end

  def has_chore?(chore) do
    find_element(:class, "chores-list__chore-#{chore.id}")
  end

  def has_chore_description?(description) do
    chore_list = find_element(:class, "chores-list__item-container")

    visible_text(chore_list) == description
  end

  def has_flash_message?(message) do
    alert_message = find_element(:class, "alert-info")

    visible_text(alert_message) == message
  end

  def has_no_chores_message?() do
    find_element(:class, "chores-list__no-chores")
  end

end
