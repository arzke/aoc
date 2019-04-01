defmodule WordTest do
  use ExUnit.Case
  doctest Word

  test "when first string is foo and second string is foo it returns 0" do
    assert Word.distance("foo", "foo") == 0
  end

  test "when first string is bar and second string is bar it returns 0" do
    assert Word.distance("bar", "bar") == 0
  end

  test "when first string is foo and second string is fob it returns 1" do
    assert Word.distance("foo", "fob") == 1
  end

  test "when first string is fob and second string is foo it returns 1" do
    assert Word.distance("fob", "foo") == 1
  end

  test "when first string is bar and second string is bor it returns 1" do
    assert Word.distance("bar", "bor") == 1
  end

  test "when list is empty it returns an empty list" do
    assert Word.calculate_distances([]) === []
  end

  test "when there is only one value it returns an empty list" do
    assert Word.calculate_distances(["foo"]) === []
  end

  test "it returns the distances for the passed values" do
    assert Word.calculate_distances(["faa", "foo", "for"]) === [
      {"foo", "for", 1},
      {"faa", "for", 2},
      {"faa", "foo", 2},
    ]
  end
end
