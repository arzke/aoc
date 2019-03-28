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
    |> Duplicate.find(1)
  end
end

FrequencyCalibration.start()
