# ObanDocker Bug ?

Trying to replicate a bug - or at least a very weird behaviour - explained [on ElixirForum](https://elixirforum.com/t/unusual-oban-behaviour-15-second-delays/51533)
## Usage

```
docker compose build
docker compose run app bash
```

In the shell:

```
mix do deps.get, ecto.create, ecto.migrate
iex -S mix
```

In IEx:

```elixir
ObanDocker.Tester.new(%{}) |> Oban.insert!()
```
