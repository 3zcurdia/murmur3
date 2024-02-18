defmodule Murmur3 do
  @moduledoc """
  Wrapper for `Murmur3`.
  """
  alias Murmur3.Wrapper

  @doc """
  Generates a 32-bit Murmur3 hash.

  ## Examples

      iex> Murmur3.murmur3_32("hello")
      {:ok, 613153351}
      iex> Murmur3.murmur3_32("hello", 123)
      {:ok, 1573043710}
  """
  @spec murmur3_32(binary()) :: {atom(), integer() } | {atom(), binary()}
  @spec murmur3_32(binary(), integer()) :: {atom(), integer() } | {atom(), binary()}
  def murmur3_32(input, seed \\ 0) do
    Wrapper.gen32(input, seed)
  end

  @doc """
  Generates a x64 128-bit Murmur3 hash.

  ## Examples

      iex> Murmur3.murmur3_x64_128("hello")
      {:ok, 121118445609844952839898260755277781762}
      iex> Murmur3.murmur3_x64_128("hello", 123)
      {:ok, 19243349499071459060235768594146641163}
  """
  @spec murmur3_x64_128(binary()) :: {atom(), integer() } | {atom(), binary()}
  @spec murmur3_x64_128(binary(), integer()) :: {atom(), integer() } | {atom(), binary()}
  def murmur3_x64_128(input, seed \\ 0) do
    input |> Wrapper.gen_x64(seed) |> cast_int_result()
  end

  @doc """
  Generates a x86 128-bit Murmur3 hash.

  ## Examples

      iex> Murmur3.murmur3_x86_128("hello")
      {:ok, 205839232668418009241864179939306390688}
      iex> Murmur3.murmur3_x86_128("hello", 123)
      {:ok, 39646137218600763345533167485429249129}
  """
  @spec murmur3_x86_128(binary()) :: {atom(), integer() } | {atom(), binary()}
  @spec murmur3_x86_128(binary(), integer()) :: {atom(), integer() } | {atom(), binary()}
  def murmur3_x86_128(input, seed \\ 0) do
    input |> Wrapper.gen_x86(seed) |> cast_int_result()
  end

  defp cast_int_result({:ok, result}), do: {:ok, result |> Integer.parse() |> elem(0)}
  defp cast_int_result(any), do: any
end
