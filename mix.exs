defmodule Murmur3.MixProject do
  use Mix.Project

  def project do
    [
      app: :murmur3,
      version: "0.1.0",
      elixir: ">= 1.10.0",
      source_url: "https://github.com/3zcurdia/murmur3",
      description: "Nif Wrapper for Murmur3 rust library",
      license: "MIT",
      authors: ["Luis Ezcurdia"],
      start_permanent: Mix.env() == :prod,
      build_embedded: Mix.env() == :prod,
      package: package(),
      deps: deps(),
      docs: docs(),
    ]
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      extra_applications: [:logger]
    ]
  end

  def package do
    [
      licenses: ["MIT"],
      links: %{"GitHub" => "https://github.com/3zcurdia/murmur3"}
    ]
  end

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      {:rustler, "~> 0.35.0"},
      {:ex_doc, "~> 0.36.0", only: :dev}
      # {:dep_from_hexpm, "~> 0.3.0"},
      # {:dep_from_git, git: "https://github.com/elixir-lang/my_dep.git", tag: "0.1.0"}
    ]
  end

  def docs do
    [
      extras: ["README.md"]
    ]
  end
end
