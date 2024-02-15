defmodule Murmur3Test do
  use ExUnit.Case
  doctest Murmur3

  test "greets the world" do
    assert Murmur3.hello() == :world
  end
end
