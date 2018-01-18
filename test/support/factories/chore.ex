defmodule Tergeo.Factory.Chore do
  defmacro __using__(_) do
    quote do

      def chore_factory do
        %TergeoWeb.Chore{
          description: sequence(:description, &"Cleanify #{&1}"),
        }
      end
      
    end
  end
end