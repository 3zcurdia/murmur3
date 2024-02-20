# Benchmarks

## Environment

Operating System: macOS
CPU Information: Apple M3 Pro
Number of Available Cores: 11
Available memory: 36 GB
Elixir 1.16.1
Erlang 26.2.1
JIT enabled: true

## Benchmakr Setup

Benchmark suite executing with the following configuration:
warmup: 2 s
time: 10 s
memory time: 2 s
reduction time: 0 ns
parallel: 1
inputs: none specified
Estimated total run time: 1 min 24 s

## Results

Name            |         ips  |      average | deviation    |     median    |     99th %
Native x64_128  |      1.54 M  |      0.65 μs | ±2971.08%    |    0.58 μs    |    0.75 μs
Native x86_32   |      1.43 M  |      0.70 μs |   ±46.19%    |    0.71 μs    |    0.88 μs
Native x86_128  |      1.36 M  |      0.73 μs | ±2993.71%    |    0.63 μs    |    0.88 μs
Elixir x64_32   |      0.25 M  |      4.01 μs |  ±127.80%    |       4 μs    |    5.29 μs
Elixir x86_128  |      0.21 M  |      4.66 μs |  ±339.33%    |    4.42 μs    |    6.25 μs
Elixir x64_128  |     0.115 M  |      8.73 μs |   ±45.09%    |    8.54 μs    |   12.21 μs

Comparison:
Native x64_128        1.54 M
Native x86_32         1.43 M - 1.08x slower +0.0517 μs
Native x86_128        1.36 M - 1.13x slower +0.0842 μs
Elixir x64_32         0.25 M - 6.18x slower +3.36 μs
Elixir x86_128        0.21 M - 7.18x slower +4.01 μs
Elixir x64_128       0.115 M - 13.43x slower +8.08 μs

Memory usage statistics:

Name              Memory usage
Native x64_128           752 B
Native x86_32             24 B - 0.03x memory usage -728 B
Native x86_128           752 B - 1.00x memory usage +0 B
Elixir x64_32            128 B - 0.17x memory usage -624 B
Elixir x86_128          3328 B - 4.43x memory usage +2576 B
Elixir x64_128          2880 B - 3.83x memory usage +2128 B

**All measurements for memory usage were the same**
