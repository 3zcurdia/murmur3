# Murmur3

Rust wrapper for the Murmur3 create implementation of the non-cryptographic hash Murmur3.

It aims to implement the x86_32bit, x86_128bit and x64_128bit variants.

## Installation

Add Murmur as a dependency in your mix.exs file.

```elixir
def deps do
  [
    {:murmur3, "~> 0.1.0"}
  ]
end
```

## Usage

To generate a hash for a string, use the `murmur3_x86_32` function.

```elixir
iex> Murmur3.murmur3_x86_32("hello world", 0)
{:ok, 1586663183}
```
To generate a hash for the x86_128 variant, use the `murmur3_x86_128` function.

```elixir
iex> Murmur3.murmur3_x86_128("hello world", 0)
{:ok, 206095855024402301784664199839047883400}
```
To generate a hash for the x64_128 variant, use the `murmur3_x64_128` function.

```elixir
iex> Murmur3.murmur3_x64_128("hello world", 0)
{:ok, 228083453807047072434243676435732455694}
```

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE.md) file for details

