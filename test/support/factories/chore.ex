defmodule Tergeo.Factory.Chore do

  alias Tergeo.Chores.Chore

  defmacro __using__(_) do
    quote do

      def chore_factory do
        %Chore{
          description: sequence(:description, &"Cleanify #{&1}"),
        }
      end
      
    end
  end
end