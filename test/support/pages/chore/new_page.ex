defmodule Tergeo.ChoreNewPage do
  use Tergeo.PageHelpers

  def current_page?() do
    current_path() == "/chores/new"
  end

end
