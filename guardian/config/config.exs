# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

# Configures the endpoint
config :guardian, GuardianWeb.Endpoint,
  url: [host: "localhost", port: 443],
  https: [
    port: 443,
    otp_app: :guardian,
    certfile: "priv/cert/server-cert.pem",
    keyfile: "priv/cert/server-key.pem"
  ],
  secret_key_base: "RWJU15rKSpikfE/AJ6knIqqZlnnVBaHYLPhlEFUEZ+Z1HNKmdzfJe0n48NsMJjYt",
  render_errors: [view: GuardianWeb.ErrorView, accepts: ~w(json)],
  pubsub: [name: Guardian.PubSub, adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
