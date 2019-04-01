defmodule Checksum do
  def start() do
    values = File.read!("./lib/values.txt")
    |> String.split("\n")

    values
    |> compute
    |> IO.puts()

    [{string1, string2, _} | _] = values
    |> Word.calculate_distances()
    |> Enum.filter(fn {_, _, distance} -> distance === 1 end)
    
    letters1 = String.graphemes(string1)
    letters2 = String.graphemes(string2)

    letters_in_common = letters1 -- (letters1 -- letters2)
    |> List.to_string()
    
    IO.puts("Letters in common: #{letters_in_common}")
  end

  def compute(values) do
    values
    |> Enum.map(&Occurence.count(&1))
    |> Enum.reduce({0, 0}, &sum_counts/2)
    |> compute_checksum
  end

  defp sum_counts({doubles, triples}, {doubles_total, triples_total}) do
    {
      doubles_total + min(doubles, 1),
      triples_total + min(triples, 1)
    }
  end

  defp compute_checksum({doubles_total, triples_total}) do
    doubles_total * triples_total
  end
end

Checksum.start()
