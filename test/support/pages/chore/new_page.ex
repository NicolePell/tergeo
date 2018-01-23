defmodule Tergeo.ChoreNewPage do
  use Tergeo.PageHelpers

  def path() do
    "/chores/new"
  end

  def fill_in_form(description) do
    fill_field({:class, "chore-form__description"}, description)
  end

  def submit_form() do
    click({:class, "chore-form__submit"})
  end

end
