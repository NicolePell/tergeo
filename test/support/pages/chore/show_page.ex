defmodule Tergeo.ChoreShowPage do
  use Tergeo.PageHelpers

  def current_page?(chore) do
    current_path() == "/chores/#{chore.id}"
  end

  def has_chore_description?(chore) do
    find_element(:class, "chores-details__chore-description")
    |> visible_text == chore.description
  end

end
