defmodule TergeoWeb.ChoreView do
  use TergeoWeb.Web, :view

  def load_user_groups(user_groups) do
    for group <- user_groups do
      { group.name, group.id }
    end
  end

end
