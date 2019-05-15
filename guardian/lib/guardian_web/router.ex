defmodule GuardianWeb.Router do
  use GuardianWeb, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  get "/", GuardianWeb.ValidationController, :health

  scope "/api", GuardianWeb do
    pipe_through :api

    post "/validate", ValidationController, :post
  end
end
