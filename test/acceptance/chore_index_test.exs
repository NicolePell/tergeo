defmodule Tergeo.Acceptance.IndexTest do
  use TergeoWeb.AcceptanceCase
  
  test "View the list of chores" do
    chores = insert_list(5, :chore)

    get build_conn(), chore_path(build_conn(), :index)

    assert has_chore?(chores |> Enum.at(0))
    assert has_chore?(chores |> Enum.at(1))
    assert has_chore?(chores |> Enum.at(2))
  end

  defp has_chore?(chore) do
    find_element(:class, "chore-#{chore.id}")
  end

end
