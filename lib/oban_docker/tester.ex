defmodule ObanDocker.Tester do
  @moduledoc false

  use Oban.Worker, queue: :default

  require Logger

  @spec perform(Oban.Job.t()) :: :ok
  def perform(%Job{args: %{"id" => id}}) do
    # Process.sleep(100)
    Logger.info("#{id}: processing ...")
    :ok
  end

  def perform(%Job{}) do
    Logger.info("Enqueueing jobs ...")
    jobs = for i <- 1..100, do: new(%{"id" => i})
    Oban.insert_all(jobs)

    :ok
  end
end
