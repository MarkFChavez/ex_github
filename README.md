# Github

## Usage

```elixir
{:ok, pid} = Github.start()

Github.get("mrkjlchvz")
Github.get("ccelestial")
Github.get("bnicart")
```

## Installation

If [available in Hex](https://hex.pm/docs/publish), the package can be installed
by adding `github` to your list of dependencies in `mix.exs`:

```elixir
def deps do
  [{:github, "~> 0.1.0"}]
end
```

Documentation can be generated with [ExDoc](https://github.com/elixir-lang/ex_doc)
and published on [HexDocs](https://hexdocs.pm). Once published, the docs can
be found at [https://hexdocs.pm/github](https://hexdocs.pm/github).
