defmodule Schizo do
  @moduledoc """
    A nice module that lets you upcase or unvowel from every other word in a sentence
  """

  @doc """
    Uppercase every other word in a sentence, Example:
    iex> Schizo.uppercase("you are awesome")
    "you ARE AWESOME"
  """
  def uppercase(string) do
    transformer(string, &upcaser/1)
  end

  @doc """
    Removes vowels from every other word in a sentence. Example:

    iex> Schizo.unvowel("you are silly")
    "you r slly"
  """
  def unvowel(string) do
    transformer(string, &unvoweler/1)
  end

  defp transformer(string, transformation) do
    string
      |> String.split()
      |> Stream.with_index
      |> Enum.map(transformation)
      |> Enum.join(" ")
  end

  defp upcaser(input) do
    transform(input, &String.upcase/1)
  end

  defp unvoweler(input) do
    transform(input, fn (word) -> Regex.replace(~r/[aeiou]/, word, "")  end)
  end

  defp transform({word, index}, transformation) do
    case {word, index} do
      {word, 0} -> word
      _         -> transformation.(word)
    end
  end
end
