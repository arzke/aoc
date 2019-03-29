defmodule ChecksumTest do
  use ExUnit.Case
  doctest Checksum

  test "when list is empty it should return 0" do
    assert Checksum.compute([]) == 0
  end

  test "when there is not at least one double and one triple in the values it should return 0" do
    assert Checksum.compute(["a"]) == 0
    assert Checksum.compute(["aa"]) == 0
    assert Checksum.compute(["aaa"]) == 0
    assert Checksum.compute(["aa", "bb"]) == 0
  end

  test "when there is one double and one triple in the value it should return 1" do
    assert Checksum.compute(["aaa", "bbc"]) == 1
    assert Checksum.compute(["aaa", "bb"]) == 1
    assert Checksum.compute(["aa", "bbb"]) == 1
  end

  test "it computes a long list of values" do
    assert Checksum.compute([
             "abcdef",
             "bababc",
             "abbcde",
             "abcccd",
             "aabcdd",
             "abcdee",
             "ababab"
           ]) == 12
  end
end
