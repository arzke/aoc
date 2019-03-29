defmodule ChecksumTest do
  use ExUnit.Case
  doctest Checksum

  test "when id is empty it should return 0 and 0" do
    assert {0, 0} = Checksum.count_duplicates("")
  end

  test "when the id has no duplicate it should return 0 and 0" do
    assert {0, 0} = Checksum.count_duplicates("a")
  end

  test "when the id has a double a it should return 1 and 0" do
    {doubles, triples} = Checksum.count_duplicates("aa")

    assert {^doubles, ^triples} = {1, 0}
  end

  test "when the id has a double b it should return 1 and 0" do
    {doubles, triples} = Checksum.count_duplicates("bb")

    assert {^doubles, ^triples} = {1, 0}
  end

  test "when the id is 2 characters long and has no duplicate it should return 0 and 0" do
    {doubles, triples} = Checksum.count_duplicates("ab")

    assert {^doubles, ^triples} = {0, 0}
  end

  test "when the id is 3 characters long and has no duplicate it should return 0 and 0" do
    {doubles, triples} = Checksum.count_duplicates("abc")

    assert {^doubles, ^triples} = {0, 0}
  end

  test "when the id is 3 characters long and has a double a it should return 1 and 0" do
    {doubles, triples} = Checksum.count_duplicates("aab")

    assert {^doubles, ^triples} = {1, 0}
  end

  test "when the id is 3 characters long and has a triple a it should return 0 and 1" do
    {doubles, triples} = Checksum.count_duplicates("aaa")

    assert {^doubles, ^triples} = {0, 1}
  end

  test "when the id has a triple a and a double b it should return 1 and 1" do
    {doubles, triples} = Checksum.count_duplicates("aabab")

    assert {^doubles, ^triples} = {1, 1}
  end

  test "when the id has a triple a and a double b and a double c it should return 2 and 1" do
    {doubles, triples} = Checksum.count_duplicates("acabcab")

    assert {^doubles, ^triples} = {2, 1}
  end
end
