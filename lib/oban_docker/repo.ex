defmodule ObanDocker.Repo do
  use Ecto.Repo,
    otp_app: :oban_docker,
    adapter: Ecto.Adapters.Postgres

  def init(_type, config) do
    {:ok, Keyword.put(config, :timeout, 60_000)}
  end
end
