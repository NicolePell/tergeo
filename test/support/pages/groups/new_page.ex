defmodule Tergeo.GroupNewPage do
  use Tergeo.PageHelpers

  def visit do
    navigate_to("/groups/new")
  end

  def fill_in_form(name) do
    fill_field({:class, "group-form__name"}, name)
  end

  # def submit_form() do
  #   click({:class, "chore-form__submit"})
  # end

  # def has_help_block?(message) do
  #   validation = find_element(:class, "help-block")

  #   visible_text(validation) == message
  # end

  # def has_flash_message?(message) do
  #   alert_message = find_element(:class, "alert-danger")

  #   visible_text(alert_message) == message
  # end

end
