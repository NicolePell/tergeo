defmodule Tergeo.Factory.Group do

  alias Tergeo.Groups.Group

  defmacro __using__(_) do
    quote do

      def group_factory do
        %Group{
          name: sequence(:name, &"Gryffindor #{&1}"),
        }
      end
      
    end
  end
end