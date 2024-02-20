text = "lorem ipsum dolor quet sit amet, consectetur adipiscing elit. Sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum."

Benchee.run(
  %{
    "Elixir x64_32" => fn -> Murmur.hash_x86_32(text, 0) end,
    "Elixir x86_128" => fn -> Murmur.hash_x86_128(text, 0) end,
    "Elixir x64_128" => fn -> Murmur.hash_x64_128(text, 0) end,
    "Native x86_32" => fn -> Murmur3.murmur3_x86_32(text) end,
    "Native x86_128" => fn -> Murmur3.murmur3_x86_128(text) end,
    "Native x64_128" => fn -> Murmur3.murmur3_x64_128(text) end,
  },
  time: 10,
  memory_time: 2,
  formatters: [Benchee.Formatters.Console, Benchee.Formatters.HTML]
)
