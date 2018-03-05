defmodule Simple.Mixfile do
  use Mix.Project

  def project do
    [
      app: :simple,
      version: "0.1.0",
      elixir: "~> 1.5",
      start_permanent: Mix.env == :prod,
      deps: deps()
    ]
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      extra_applications: [:logger],
      mod: {Simple.Application, []}
    ]
  end

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      {:ace, "~> 0.15.10"},
      {:httpoison, "~> 0.9.0"},
      {:poison, "~> 2.0"},
      {:white_bread, "~> 3.1", only: [:dev, :test] }
    ]
  end
end
