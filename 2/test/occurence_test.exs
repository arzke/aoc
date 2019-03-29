defmodule OccurenceTest do
  use ExUnit.Case
  doctest Occurence

  test "when id is empty it should return 0 and 0" do
    assert {0, 0} = Occurence.count("")
  end

  test "when the id has no duplicate it should return 0 and 0" do
    assert {0, 0} = Occurence.count("a")
  end

  test "when the id has a double a it should return 1 and 0" do
    {doubles, triples} = Occurence.count("aa")

    assert {^doubles, ^triples} = {1, 0}
  end

  test "when the id has a double b it should return 1 and 0" do
    {doubles, triples} = Occurence.count("bb")

    assert {^doubles, ^triples} = {1, 0}
  end

  test "when the id is 2 characters long and has no duplicate it should return 0 and 0" do
    {doubles, triples} = Occurence.count("ab")

    assert {^doubles, ^triples} = {0, 0}
  end

  test "when the id is 3 characters long and has no duplicate it should return 0 and 0" do
    {doubles, triples} = Occurence.count("abc")

    assert {^doubles, ^triples} = {0, 0}
  end

  test "when the id is 3 characters long and has a double a it should return 1 and 0" do
    {doubles, triples} = Occurence.count("aab")

    assert {^doubles, ^triples} = {1, 0}
  end

  test "when the id is 3 characters long and has a triple a it should return 0 and 1" do
    {doubles, triples} = Occurence.count("aaa")

    assert {^doubles, ^triples} = {0, 1}
  end

  test "when the id has a triple a and a double b it should return 1 and 1" do
    {doubles, triples} = Occurence.count("aabab")

    assert {^doubles, ^triples} = {1, 1}
  end

  test "when the id has a triple a and a double b and a double c it should return 2 and 1" do
    {doubles, triples} = Occurence.count("acabcab")

    assert {^doubles, ^triples} = {2, 1}
  end
end
