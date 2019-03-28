defmodule Duplicate do
    def find(
         diffs,
         limit \\ 100,
         result \\ %{:first_duplicate => nil, :values => [0]}
       )

  def find(diffs, limit, result) when limit > 0 do
    result =
      diffs
      |> Enum.reduce(result, &first_duplicate_reducer/2)

    if is_nil(result[:first_duplicate]) do
      IO.puts("No result for #{limit}")
      find(diffs, limit - 1, result)
    else
      IO.puts("Result found: #{result[:first_duplicate]}")
      result[:first_duplicate]
    end
  end

  def find(_, limit, result) when limit == 0 do
    result
  end

  defp first_duplicate_reducer(diff, acc) do
    if is_nil(acc[:first_duplicate]) do
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
    else
        acc
    end
  end

  defp first_duplicate_reducer(diff, acc) do
   acc
  end
end