defmodule Schizo do

  def uppercase(string) do
    transformer(string, &upcaser/1)
  end

  def unvowel(string) do
    string
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
end
