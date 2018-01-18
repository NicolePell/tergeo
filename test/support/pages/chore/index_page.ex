defmodule Tergeo.ChoreIndexPage do
  use Tergeo.PageHelpers

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

  def has_no_chores_message?() do
    find_element(:class, "chores-list__no-chores")
  end

end
