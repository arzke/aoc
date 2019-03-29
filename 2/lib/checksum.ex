defmodule Checksum do
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
