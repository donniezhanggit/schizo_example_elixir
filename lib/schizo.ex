defmodule Schizo do

  def uppercase(string) do
    string
      |> String.split()
      |> Stream.with_index
      |> Enum.map(&upcase_other_words/1)
      |> Enum.join(" ")
  end

  defp upcase_other_words({word, index}) do
    case {word, index} do
      {word, 0} -> word
      _ -> String.upcase(word)
    end
  end
end
