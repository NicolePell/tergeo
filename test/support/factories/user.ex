defmodule Tergeo.Factory.User do

  alias Tergeo.Users.User

  defmacro __using__(_) do
    quote do

      def user_factory do
        %User{
          token: sequence(:token, &"liberacorpus#{&1}"),
          email: sequence(:email, &"half-blood#{&1}@prince.com"),
          first_name: sequence(:first_name, &"Severus#{&1}"),
          last_name: sequence(:last_name, &"Snape#{&1}"),
          provider: sequence(:provider, &"google#{&1}"),
        }
      end
      
    end
  end
end