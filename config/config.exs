# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

config :thatha_blog,
  ecto_repos: [ThathaBlog.Repo]

# Configures the endpoint
config :thatha_blog, ThathaBlogWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "4LRWqZDxUwYTkVul8bucOquslXGlhGjjkLaCVWpwE7T5wphbaxzIF8jrMHaE4mHM",
  render_errors: [view: ThathaBlogWeb.ErrorView, accepts: ~w(json), layout: false],
  pubsub_server: ThathaBlog.PubSub,
  live_view: [signing_salt: "dzWfAf3d"]

config :thatha_blog, ThathaBlog.Repo,
  migration_primary_key: [type: :binary_id],
  migration_foreign_key: [type: :binary_id]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
