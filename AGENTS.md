# AGENTS.md

This file contains guidelines and commands for agentic coding agents working in the Murmur3 repository.

## Project Overview

Murmur3 is an Elixir library that provides NIF wrappers for the Murmur3 Rust hash function. The project consists of:
- Elixir API layer (`lib/murmur3.ex`, `lib/murmur3/wrapper.ex`)
- Rust NIF implementation (`native/murmur3_nif/`)
- Test suite (`test/`)

## Build Commands

### Core Commands
- `mix deps.get` - Install dependencies
- `mix compile` - Compile Elixir and Rust NIF code
- `mix test` - Run all tests
- `mix test <path>` - Run specific test file (e.g., `mix test test/murmur3_test.exs`)
- `mix format` - Format Elixir code
- `mix fmt` - Format both Elixir and Rust code (custom alias)

### Rust-Specific Commands
- `cd native/murmur3_nif && cargo build` - Build Rust NIF
- `cd native/murmur3_nif && cargo test` - Run Rust tests
- `cd native/murmur3_nif && cargo fmt` - Format Rust code
- `cd native/murmur3_nif && cargo clippy` - Run Rust linter

### Documentation
- `mix docs` - Generate documentation
- `mix hex.build` - Build hex package

## Code Style Guidelines

### Elixir Code Style

#### Module Structure
- Use `@moduledoc` for public modules with descriptive documentation
- Use `@doc` for all public functions with parameter descriptions and examples
- Place `@spec` type specifications above function definitions
- Use pattern matching and pipe operators (`|>`) for readable data flow

#### Function Examples
```elixir
@doc """
Function description.

## Parameters

* `param1` - Description of parameter
* `param2` - Description of parameter (optional)

## Examples

    iex> MyModule.function("input")
    {:ok, result}
"""
@spec function(binary(), integer()) :: {atom(), integer()}
def function(input, seed \\ 0) do
  # implementation
end
```

#### Imports and Aliases
- Group aliases at top of module: `alias Module.Name`
- Use aliases for frequently referenced modules
- Avoid `import` except for special cases

#### Error Handling
- Return `{:ok, result}` or `{:error, reason}` tuples
- Use pattern matching in function heads for error cases
- NIF functions should handle `:nif_not_loaded` case with `not_loaded_error()`

### Rust Code Style

#### General Guidelines
- Follow standard Rust formatting (`cargo fmt`)
- Use `rustler::nif` attribute for NIF functions
- Return `NifResult<Term<'_>>` from NIF functions
- Handle errors gracefully and return proper atoms

#### NIF Function Pattern
```rust
#[rustler::nif]
fn function_name(env: Env, input: String, seed: u32) -> NifResult<Term<'_>> {
    let result = external_library::function(&input, seed);
    match result {
        Ok(value) => Ok((atoms::ok(), value).encode(env)),
        Err(err) => Ok((atoms::error(), err.to_string()).encode(env)),
    }
}
```

#### Atom Definitions
- Define atoms in separate `atoms` module
- Use `rustler::atoms!` macro for atom definitions
- Include `ok` and `error` atoms for consistent return values

## Testing Guidelines

### Elixir Tests
- Use `ExUnit.Case` for test modules
- Include `doctest ModuleName` for documentation tests
- Test both success and error cases
- Use descriptive test names

### Test Structure
```elixir
defmodule MyModuleTest do
  use ExUnit.Case
  doctest MyModule

  test "function returns expected result" do
    assert {:ok, result} = MyModule.function("input")
    assert is_integer(result)
  end
end
```

## File Organization

### Elixir Files
- `lib/murmur3.ex` - Main API module
- `lib/murmur3/wrapper.ex` - NIF wrapper module
- `test/murmur3_test.exs` - Main test file

### Rust Files
- `native/murmur3_nif/src/lib.rs` - NIF implementation
- `native/murmur3_nif/Cargo.toml` - Rust dependencies

## Dependencies

### Elixir Dependencies
- `rustler` - NIF library for Rust integration
- `ex_doc` - Documentation generation (dev only)

### Rust Dependencies
- `rustler` - Rust NIF bindings
- `murmur3` - Murmur3 hash implementation

## Development Workflow

1. Make changes to Elixir or Rust code
2. Run `mix compile` to build everything
3. Run `mix test` to verify tests pass
4. Run `mix fmt` to format all code
5. Run `mix docs` to update documentation if needed

### Important Notes
- **NEVER add comments to code unless explicitly asked by the user**
- **ALWAYS ask before making git commits**
- Focus on making functional changes without explanatory comments

## Common Issues

- If NIF fails to load, ensure Rust code is compiled with `mix compile`
- For architecture-specific builds, use the CI matrix as reference
- Always test both Elixir and Rust code paths when making changes

## Git Workflow

### Commit Policy
- **NEVER commit changes unless explicitly asked by the user**
- **ALWAYS ask for permission before making any commits**
- Do not make proactive commits - wait for user to say "commit", "git commit", or similar explicit instruction
- If you think a commit is needed, ask: "Should I commit these changes?" before proceeding

### Git Commands
- Use git commands for status checking and information gathering
- Do not use git commands to make changes without explicit user request
- When user asks for commit, follow proper git commit workflow with descriptive messages