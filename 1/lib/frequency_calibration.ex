defmodule FrequencyCalibration do
  def start() do
    diffs = File.read!("./lib/diffs.txt")

    parsed_diffs =
      diffs
      |> String.split("\r\n")
      |> Enum.map(&String.to_integer/1)

    parsed_diffs
    |> Enum.sum()
    |> IO.puts()

    parsed_diffs
    |> get_first_duplicate(200)
  end

  def get_first_duplicate(
         diffs,
         limit \\ 100,
         result \\ %{:first_duplicate => nil, :values => [0]}
       )

  def get_first_duplicate(diffs, limit, result) when limit > 0 do
    result =
      diffs
      |> Enum.reduce(result, &first_duplicate_reducer/2)

    if is_nil(result[:first_duplicate]) do
      IO.puts("No result for #{limit}")
      get_first_duplicate(diffs, limit - 1, result)
    else
      IO.puts("Result found: #{result[:first_duplicate]}")
      result[:first_duplicate]
    end
  end

  def get_first_duplicate(_, limit, result) when limit == 0 do
    result
  end

  defp first_duplicate_reducer(diff, acc) when is_nil(acc[:first_duplicate]) do
    sum = Enum.at(acc[:values], 0) + diff

    %{
      :first_duplicate =>
        cond do
          Enum.find(acc[:values], fn value -> value == sum end) ->
            sum

          true ->
            nil
        end,
      :values => [sum | acc[:values]]
    }
  end

  defp first_duplicate_reducer(diff, acc) do
   acc
  end
end

FrequencyCalibration.start()
