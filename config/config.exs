# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

config :kubeapp,
  namespace: KubeApp

# Configures the endpoint
config :kubeapp, KubeAppWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "h+G0zOL7OyvM9jMLz7dn5Jkj2IJrkDzhMl3bvVpaaIpZD75nUqG8jmpAJQjiGdyk",
  render_errors: [view: KubeAppWeb.ErrorView, accepts: ~w(html json), layout: false],
  pubsub_server: KubeApp.PubSub,
  live_view: [signing_salt: "dcS6B+0r"]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
