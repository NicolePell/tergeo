# Tergeo

##### To start this app locally:

  * Install dependencies with `mix deps.get`
  * Create and migrate your database with `mix ecto.create && mix ecto.migrate`
  * Install Node.js dependencies with `cd assets && npm install`
  * Start Phoenix endpoint with `mix phx.server`

##### To start this app using Docker (assuming docker and docker-compose are installed):

  * Build and run the containers with `docker-compose up -d --build phoenix`
  * Create your database with `docker-compose run mix ecto.create`
  * Migrate your database with ` docker-compose run mix ecto.migrate`
  * Now you can visit [`localhost:4000`](http://localhost:4000) from your browser

##### Running tests:

  * Install and start a selenium server, e.g. `brew services start selenium-server-standalone`
  * Run all the tests with `mix test` or `mix test --trace` to see them run in progress
  * Run only the current in progress tests with `mix test --only current`
