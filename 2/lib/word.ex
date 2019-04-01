defmodule Word do
  def calculate_distances(values, distances \\ [])

  def calculate_distances(values, distances) when length(values) >= 2 do
    [head | tail] = values
    
    distances = tail
    |> Enum.reduce(distances, fn value, acc ->
      [{head, value, distance(head, value)} | acc]
    end)

    calculate_distances(tail, distances)
  end 

  def calculate_distances(values, distances) do
    distances
  end 

  def distance(string1, string2) do
    Enum.zip(String.graphemes(string1), String.graphemes(string2))
    |> Enum.reduce(0, fn {a, b}, distance ->
      if a === b, do: distance, else: distance + 1
    end)
  end
end
