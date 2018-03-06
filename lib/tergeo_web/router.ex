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

    get "/", HomeController, :index
    resources "/groups", GroupController
  end
  
  scope "/", TergeoWeb do
    pipe_through [:browser, TergeoWeb.Plugs.RequireLogin] 
    
    resources "/chores", ChoreController
  end
  
  scope "/auth", TergeoWeb do
    pipe_through :browser

    get "/signout", AuthController, :delete
    get "/:provider", AuthController, :request
    get "/:provider/callback", AuthController, :new
  end
  
end
