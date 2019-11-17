defmodule BirdsWeb.Router do
  use BirdsWeb, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/api", BirdsWeb do
    pipe_through :api
  end
end
