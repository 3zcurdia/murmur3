defmodule Murmur3.MixProject do
  use Mix.Project

  def project do
    [
      app: :murmur3,
      compilers: Mix.compilers(),
      rustler_crates: [
        expolars: [
          path: "native/murmur3_nif",
          mode: if(Mix.env() == :prod, do: :release, else: :debug)
        ]
      ],
      version: "0.1.2",
      elixir: ">= 1.10.0",
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
      files: ["lib", "native", "mix.exs", "README*", "LICENSE*"],
      maintainers: ["ing.ezcurdia@gmail.com"],
      licenses: ["MIT"],
      links: %{"GitHub" => "https://github.com/3zcurdia/murmur3"}
    ]
  end

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      {:rustler, "~> 0.37.1"},
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
