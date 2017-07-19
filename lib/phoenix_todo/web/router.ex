defmodule PhoenixTodo.Web.Router do
  use PhoenixTodo.Web, :router

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

  scope "/", PhoenixTodo.Web do
    pipe_through :browser # Use the default browser stack

    get "/", PageController, :index
  end

  scope "/todo", PhoenixTodo.Web do
    pipe_through :api

    resources "/", TodoController
  end

  # Other scopes may use custom stacks.
  # scope "/api", PhoenixTodo.Web do
  #   pipe_through :api
  # end
end
