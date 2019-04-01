defmodule Word do
  def distance(string1, string2) do
    Enum.zip(String.graphemes(string1), String.graphemes(string2))
    |> Enum.reduce(0, fn {a, b}, distance ->
      if a === b, do: distance, else: distance + 1
    end)
  end
end
