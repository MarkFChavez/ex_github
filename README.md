# Github

This is a basic implementation of fetching a list of GitHub repositories by
passing in a username.

## So What's Special?

It enables a caching mechanism that stores the username as a key and his/her
repositories as its value. So that subsequent calls to the same *username*
will not call GitHub.

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
