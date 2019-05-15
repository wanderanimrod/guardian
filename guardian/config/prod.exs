use Mix.Config

config :guardian, GuardianWeb.Endpoint,
  http: [:inet6, port: System.get_env("PORT") || 4000],
  url: [host: "example.com", port: 80]

config :phoenix, :serve_endpoints, true

config :logger, level: :debug, handle_otp_reports: false

import_config "prod.secret.exs"
