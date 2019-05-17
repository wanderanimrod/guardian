use Mix.Config

config :guardian, GuardianWeb.Endpoint,
  url: [host: "guardian.svc.default", port: 443]

config :phoenix, :serve_endpoints, true

config :logger, level: :debug, handle_otp_reports: false

import_config "prod.secret.exs"
