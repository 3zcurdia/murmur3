defmodule Murmur3.MixProject do
  use Mix.Project

  @version "0.2.0"

  def project do
    [
      app: :murmur3,
      version: @version,
      elixir: "~> 1.16",
      source_url: "https://github.com/3zcurdia/murmur3",
      description: "Nif Wrapper for Murmur3 rust library",
      license: "MIT",
      authors: ["Luis Ezcurdia"],
      start_permanent: Mix.env() == :prod,
      package: package(),
      deps: deps(),
      aliases: aliases(),
      docs: docs()
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
      files: [
        "lib",
        "native/murmur3_nif/.cargo",
        "native/murmur3_nif/src",
        "native/murmur3_nif/Cargo.toml",
        "checksum-*.exs",
        "mix.exs",
        "README*",
        "LICENSE*"
      ],
      maintainers: ["ing.ezcurdia@gmail.com"],
      licenses: ["MIT"],
      links: %{"GitHub" => "https://github.com/3zcurdia/murmur3"}
    ]
  end

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      {:rustler_precompiled, "~> 0.10.1"},
      {:rustler, "~> 0.37", optional: true},
      {:styler, "~> 1.10", only: [:dev, :test], runtime: false},
      {:credo, "~> 1.7", only: [:dev, :test], runtime: false},
      {:ex_doc, "~> 0.40.0", only: :dev}
    ]
  end

  def docs do
    [
      extras: ["README.md"]
    ]
  end

  defp aliases do
    [
      fmt: [
        "format",
        "cmd cargo fmt --manifest-path native/murmur3_nif/Cargo.toml"
      ]
    ]
  end
end
