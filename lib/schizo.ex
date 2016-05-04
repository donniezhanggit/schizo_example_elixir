defmodule Schizo do

  def uppercase(string) do
    transformer(string, &upcaser/1)
  end

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

  defp upcaser({word, index}) do
    case {word, index} do
      {word, 0} -> word
      _ -> String.upcase(word)
    end
  end

  defp unvoweler({word, index}) do
    case {word, index} do
      {word, 0} -> word
      _         -> Regex.replace(~r/[aeiou]/, word, "")
    end
  end
end
