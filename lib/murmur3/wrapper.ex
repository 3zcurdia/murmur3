defmodule Murmur3.Wrapper do
  use Rustler, otp_app: :murmur3, crate: "murmur3_nif"

  @spec gen32(any(), any()) :: integer()
  def gen32(_input, _seed), do: not_loaded_error()

  @spec gen_x64(any(), any()) :: binary()
  def gen_x64(_input, _seed), do: not_loaded_error()

  @spec gen_x86(any(), any()) :: binary()
  def gen_x86(_input, _seed), do: not_loaded_error()

  defp not_loaded_error(), do: :erlang.nif_error(:nif_not_loaded)
end
