# Messiaen

Utility library for alphabet mappings based on Olivier Messiaen's _Méditations sur le Mystère de la Sainte Trinité_.

This library includes Messiaen's original French alphabet mappings, and also a mapping for English by mapping letter frequencies from French to English.

## Usage

### `Messiaen.length/2`

This function returns the numeric length based on the alphabet mappings for a lowercase alphabet character.

```elixir
iex> Messiaen.length(?h)
5
```

You can specify the language to use for the mapping as one of `:en` (default) or `:fr`

```elixir
iex> Messiaen.length(?h, :fr)
3
```

This function returns a value of 4 for the space character, and `nil` for any other character.


### `Messiaen.lengths/2`

This function takes a string and returns the non-`nil` lengths of its characters after converting to lowercase.


```elixir
iex> Messiaen.lengths("hello")
[5, 1, 2, 2, 1]

iex> Messiaen.lengths("HeLlO")
[5, 1, 2, 2, 1]

iex> Messiaen.lengths("7HeL=lO+")
[5, 1, 2, 2, 1]
```

## Installation

If [available in Hex](https://hex.pm/docs/publish), the package can be installed
by adding `messiaen` to your list of dependencies in `mix.exs`:

```elixir
def deps do
  [
    {:messiaen, "~> 0.1.0"}
  ]
end
```

Documentation can be generated with [ExDoc](https://github.com/elixir-lang/ex_doc)
and published on [HexDocs](https://hexdocs.pm). Once published, the docs can
be found at <https://hexdocs.pm/messiaen>.

