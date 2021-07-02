# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

config :pento,
  ecto_repos: [Pento.Repo]

# Configures the endpoint
config :pento, PentoWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "pg8UHTXdCg4FaG+PiCSfwKAKnk2YFg6n78XhZH38hLNZj8aamhAVsinleE7tx49X",
  render_errors: [view: PentoWeb.ErrorView, accepts: ~w(html json), layout: false],
  pubsub_server: Pento.PubSub,
  live_view: [signing_salt: "OlFJlQYi"]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
