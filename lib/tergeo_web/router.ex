defmodule TergeoWeb.Router do
  use TergeoWeb.Web, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", TergeoWeb do
    pipe_through :browser 

    get "/", HomeController, :index
    
    resources "/chores", ChoreController, only: [:index, :new]
  end
  
end
