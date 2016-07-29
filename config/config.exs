# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# General application configuration
config :mula,
  ecto_repos: [Mula.Repo]

# Configures the endpoint
config :mula, Mula.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "DBeDsf9LCRlV8lmsfA1u48F4LS5XePZyHusGiHf031a6Aq2S1sFNva1D9D4WLCWx",
  render_errors: [view: Mula.ErrorView, accepts: ~w(html json)],
  pubsub: [name: Mula.PubSub,
           adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Configure guardian
config :guardian, Guardian,
  issuer: "Mula",
  ttl: { 3, :days },
  verify_issuer: true,
  serializer: PhoenixTrello.GuardianSerializer

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"
