defmodule GuardianWeb.Router do
  use GuardianWeb, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/api", GuardianWeb do
    pipe_through :api
  end
end
