defmodule TergeoWeb.Router do
  use TergeoWeb.Web, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers

    plug TergeoWeb.Plugs.SetUser
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", TergeoWeb do
    pipe_through :browser

    get "/", GroupController, :index
  end

  scope "/", TergeoWeb do
    pipe_through [:browser, TergeoWeb.Plugs.RequireLogin]

    resources "/chores", ChoreController, only: [:index, :show, :new, :create]
    get "/chores/:id/complete_chore", ChoreController, :complete_chore

    resources "/groups", GroupController
  end

  scope "/auth", TergeoWeb do
    pipe_through :browser

    get "/signout", AuthController, :delete
    get "/:provider", AuthController, :request
    get "/:provider/callback", AuthController, :new
  end

end
