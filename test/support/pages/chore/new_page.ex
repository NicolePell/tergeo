defmodule Tergeo.ChoreNewPage do
  use Tergeo.PageHelpers

  def path() do
    "/chores/new"
  end

  def fill_in_form(description) do
    fill_field({:class, "chore-form__description"}, description)
  end

  def fill_in_form(description, group) do
    fill_field({:class, "chore-form__description"}, description)
    find_element(:css, "#chore-form__groups option[value='#{group.name}']") 
    |> click()
  end
  
  def submit_form() do
    click({:class, "chore-form__submit"})
  end

  def has_help_block?(message) do
    validation = find_element(:class, "help-block")

    visible_text(validation) == message
  end

  def has_flash_message?(message) do
    alert_message = find_element(:class, "alert-danger")

    visible_text(alert_message) == message
  end

end
