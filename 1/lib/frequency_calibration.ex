defmodule FrequencyCalibration do
  def start() do
    diffs = File.read!("./lib/diffs.txt")
    limit = 1

    parsed_diffs =
      diffs
      |> String.split("\r\n")
      |> Enum.map(&String.to_integer/1)

    parsed_diffs
    |> Enum.sum()
    |> IO.puts()

    duplicate = parsed_diffs
    |> Duplicate.find(limit)

    case duplicate do
      nil ->
        IO.puts("No result found with limit set to #{limit}")
      _ ->
        IO.puts("Result found: #{duplicate}")
    end
  end
end

FrequencyCalibration.start()
