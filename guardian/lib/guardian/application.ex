defmodule Guardian.Application do
  use Application

  require Logger

  def start(_type, _args) do
    children = [
      GuardianWeb.Endpoint
    ]

    opts = [strategy: :one_for_one, name: Guardian.Supervisor]
    Supervisor.start_link(children, opts)
  end

  def config_change(changed, _new, removed) do
    GuardianWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
