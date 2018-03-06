defmodule Tergeo.GroupNewPage do
  use Tergeo.PageHelpers

  def visit do
    navigate_to("/groups/new")
  end

  def fill_in_form(name) do
    fill_field({:class, "group-form__name"}, name)
  end

  def submit_form() do
    click({:class, "group-form__submit"})
  end

end
