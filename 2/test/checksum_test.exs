defmodule ChecksumTest do
  use ExUnit.Case
  doctest Checksum

  test "when list is empty it should return 0" do
    assert Checksum.calculate([]) == 0
  end
end
