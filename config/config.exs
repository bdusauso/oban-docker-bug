import Config

config :oban_docker, ecto_repos: [ObanDocker.Repo]

config :oban_docker, ObanDocker.Repo,
  database: "oban_docker_dev",
  username: "postgres",
  password: "postgres",
  hostname: "postgres"

config :oban_docker, Oban,
  repo: ObanDocker.Repo,
  plugins: [Oban.Plugins.Pruner],
  queues: [default: 1]

config :logger,
  level: :info,
  backends: [:console]

config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:pid]

import_config "#{config_env()}.exs"
