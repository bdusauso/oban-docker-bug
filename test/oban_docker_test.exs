defmodule ObanDockerTest do
  use ExUnit.Case
  doctest ObanDocker

  test "greets the world" do
    assert ObanDocker.hello() == :world
  end
end
