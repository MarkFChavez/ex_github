defmodule Github.Mixfile do
  use Mix.Project

  def project do
    [app: :github,
     version: "0.1.0",
     elixir: "~> 1.4",
     build_embedded: Mix.env == :prod,
     start_permanent: Mix.env == :prod,
     deps: deps()]
  end

  def application do
    [
      mod: { Github.Application, [] },
      extra_applications: [:logger, :httpoison]
    ]
  end

  defp deps do
    [
      {:httpoison, "~> 0.12"},
      {:json, "~> 1.0"}
    ]
  end
end
