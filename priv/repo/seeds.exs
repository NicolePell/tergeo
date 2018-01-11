# Script for populating the database. You can run it as:
#
#     mix run priv/repo/seeds.exs
#
# Inside the script, you can read and write to any of your
# repositories directly:
#
#     Tergeo.Repo.insert!(%Tergeo.SomeModel{})
#
# We recommend using the bang functions (`insert!`, `update!`
# and so on) as they will fail if something goes wrong.

alias Tergeo.Repo
alias TergeoWeb.Chore

Repo.insert! %Chore {
  description: "Cleanify!"
}

Repo.insert! %Chore {
  description: "Scourgify!"
}