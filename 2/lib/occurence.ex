defmodule Occurence do
  def count(value) do
    occurences =
      value
      |> String.graphemes()
      |> Enum.reduce(%{}, count_occurences(value))

    {
      occurences |> Enum.filter(filter_value(2)) |> length,
      occurences |> Enum.filter(filter_value(3)) |> length
    }
  end

  defp count_occurences(value) do
    fn char, occurences ->
      case Map.has_key?(occurences, char) do
        false -> Map.put(occurences, char, length(Regex.scan(~r/#{char}/, value)))
        true -> occurences
      end
    end
  end

  defp filter_value(value) do
    fn occurence ->
      {_, count} = occurence
      count == value
    end
  end
end
