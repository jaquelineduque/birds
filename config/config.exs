# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

config :birds,
  ecto_repos: [Birds.Repo]

# Configures the endpoint
config :birds, BirdsWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "pi41sM+NgHKgv1PG3f6zS0Hmjnyr45k4wYbIm+2ApeFu0ZHxUk+ciZWMTvgOmO/q",
  render_errors: [view: BirdsWeb.ErrorView, accepts: ~w(json)],
  pubsub: [name: Birds.PubSub, adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
