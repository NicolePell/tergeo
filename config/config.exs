# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# General application configuration
config :tergeo,
  ecto_repos: [Tergeo.Repo]

# Configures the endpoint
config :tergeo, Tergeo.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "Jqt0pa/Nkg0duIYGA6+9C6ox65x642+7qoNQv7mod4OM8TbfmBoMPCkAgRv9KciS",
  render_errors: [view: Tergeo.ErrorView, accepts: ~w(html json)],
  pubsub: [name: Tergeo.PubSub,
           adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"
