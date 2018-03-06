# Tergeo

#### Requirements:

* Postgres 9.6+
* Elixir 1.4+
* Phoenix 1.3+
* Node 7.1+
* NPM 4.2+

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
  * Run all tests without acceptance tests with `mix test` 
  * OR run all the tests with `mix test --include acceptance`
  * OR run all the tests with `mix test --trace --include acceptance` to see them run in progress
