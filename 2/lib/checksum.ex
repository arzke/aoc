defmodule Checksum do
  def count_duplicates(id) do
    occurences = id
    |> String.graphemes()
    |> Enum.reduce(%{}, count_occurences)

    filter_double = filter_count(2)
    filter_triple = filter_count(3)
    
    {
      occurences |> Enum.filter(filter_double) |> length, 
      occurences |> Enum.filter(filter_triple) |> length,
    }
  end

  defp count_occurences(char, occurences) do
      case Map.has_key?(occurences, char) do
        false -> Map.put occurences, char, length(Regex.scan(~r/#{char}/, id))
        true -> occurences
      end
  end

  defp filter_count(value) do
    fn occurence ->
      {_, count} = occurence
      count == value
    end
  end
end
