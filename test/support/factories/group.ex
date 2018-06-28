defmodule Tergeo.Factory.Group do

  alias Tergeo.Groups.Group

  defmacro __using__(_) do
    quote do

      def group_factory do
        %Group{
          name: sequence(:name, &"Slytherin #{&1}"),
          owner: build(:user)
        }
      end

    end
  end
end
