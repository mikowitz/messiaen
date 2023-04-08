defmodule Messiaen do
  @fr %{
    ?a => 2,
    ?b => 3,
    ?c => 2,
    ?d => 2,
    ?e => 1,
    ?f => 6,
    ?g => 3,
    ?h => 3,
    ?i => 1,
    ?j => 1,
    ?k => 2,
    ?l => 2,
    ?m => 8,
    ?n => 7,
    ?o => 11,
    ?p => 4,
    ?q => 2,
    ?r => 3,
    ?s => 4,
    ?t => 9,
    ?u => 5,
    ?v => 2,
    ?w => 2,
    ?x => 2,
    ?y => 1,
    ?z => 4,
    ?\s => 4
  }

  @en %{
    ?a => 2,
    ?b => 3,
    ?c => 2,
    ?d => 2,
    ?e => 1,
    ?f => 2,
    ?g => 6,
    ?h => 5,
    ?i => 9,
    ?j => 4,
    ?k => 2,
    ?l => 2,
    ?m => 4,
    ?n => 7,
    ?o => 1,
    ?p => 3,
    ?q => 2,
    ?r => 11,
    ?s => 3,
    ?t => 4,
    ?u => 8,
    ?v => 1,
    ?w => 2,
    ?x => 2,
    ?y => 2,
    ?z => 2,
    ?\s => 4
  }

  @doc """
    Returns the lengths for the characters in a given string.

        iex> Messiaen.lengths("hello")
        [5, 1, 2, 2, 1]

    Before finding the lengths, converts all characters to lowercase.

        iex> Messiaen.lengths("HeLlO")
        [5, 1, 2, 2, 1]


    Any non-alphabet characters are dropped from the returned list.

        iex> Messiaen.lengths("7HeL=lO+")
        [5, 1, 2, 2, 1]

  """
  def lengths(string, lang \\ :en) when is_bitstring(string) do
    string
    |> String.downcase()
    |> to_charlist()
    |> Enum.map(&length(&1, lang))
    |> Enum.reject(&is_nil/1)
  end

  @doc """
    Returns the length value for the given lowercase alpha character in the given alphabet

        iex> Messiaen.length(?h)
        5

        iex> Messiaen.length(?h, :fr)
        3

    Returns `nil` for any other character

        iex> Messiaen.length(?A)
        nil

        iex> Messiaen.length(??)
        nil
  """
  def length(char, lang \\ :en) when is_integer(char) do
    lang
    |> alphabet()
    |> Map.get(char)
  end

  defp alphabet(:en), do: @en
  defp alphabet(:fr), do: @fr
end
