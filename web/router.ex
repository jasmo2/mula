defmodule Mula.Router do
  use Mula.Web, :router

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

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/api", Mula do
    pipe_through :api

    scope "/v1" do
      post "/registrations/companies", RegistrationController, :create
      post "/registrations/staff", RegistrationController, :create
    end
  end

  scope "/", Mula do
    pipe_through :browser # Use the default browser stack

    get "*path", PageController, :index
  end
end
