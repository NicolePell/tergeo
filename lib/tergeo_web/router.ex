defmodule TergeoWeb.Router do
  use TergeoWeb.Web, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers

    plug Tergeo.Plugs.SetUser
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", TergeoWeb do
    pipe_through :browser 

    get "/", HomeController, :index
    resources "/chores", ChoreController
    resources "/groups", GroupController
  end
  
  scope "/auth", TergeoWeb do
    pipe_through :browser

    get "/signout", AuthController, :delete
    get "/:provider", AuthController, :request
    get "/:provider/callback", AuthController, :new
  end
  
end
