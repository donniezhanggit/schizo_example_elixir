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
