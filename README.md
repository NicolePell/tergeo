# Tergeo

To start this app locally:

  * Install dependencies with `mix deps.get`
  * Create and migrate your database with `mix ecto.create && mix ecto.migrate`
  * Install Node.js dependencies with `cd assets && npm install`
  * Start Phoenix endpoint with `mix phx.server`

To start this app using Docker (assuming docker and docker-compose are installed):
  * Build and run the containers with `docker-compose up -d --build phoenix`
  * Create your database with `docker-compose run mix ecto.create`
  * Migrate your database with ` docker-compose run mix ecto.migrate`

Now you can visit [`localhost:4000`](http://localhost:4000) from your browser.

To run tests locally (on Mac with brew):
  * Start a selenium server locally `brew services start selenium-server-standalone`
  * Run the tests with `mix test`
