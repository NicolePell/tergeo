defmodule Tergeo.GroupIndexPage do
  use Tergeo.PageHelpers

  def path() do
    "/groups"
  end
  
  def visit do
    navigate_to("/groups")
  end

  def has_no_created_groups_message?() do
    find_element(:class, "created-groups-list__no-groups")
    find_element(:class, "created-groups-list__start-group")
  end

  def has_group?(group) do
    find_element(:class, "groups-list__group-#{group.id}")
  end

  def view_group(group) do
    find_element(:class, "groups-list__group-link-#{group.id}")
    |> click
  end
end
