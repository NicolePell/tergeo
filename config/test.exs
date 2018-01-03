use Mix.Config

# We don't run a server during test. If one is required,
# you can enable the server option below.
config :tergeo, TergeoWeb.Endpoint,
  http: [port: 4001],
  server: true

# Print only warnings and errors during test
config :logger, level: :warn

# Configure your database
config :tergeo, Tergeo.Repo,
  adapter: Ecto.Adapters.Postgres,
  username: "tergeo",
  database: "tergeo_test",
  hostname: "localhost",
  pool: Ecto.Adapters.SQL.Sandbox

  config :hound, browser: :chrome