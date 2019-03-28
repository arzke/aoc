defmodule DuplicateTest do
  use ExUnit.Case
  doctest Duplicate

  test "when operations are +1, -1, the first duplicate is 0" do
    assert Duplicate.find([+1, -1]) == 0
  end

  test "when operations are +3, +3, +4, -2, -4, the first duplicate is 10" do
    assert Duplicate.find([+3, +3, +4, -2, -4]) == 10
  end

  test "when operations are -6, +3, +8, +5, -6, the first duplicate is 5" do
    assert Duplicate.find([-6, +3, +8, +5, -6]) == 5
  end

  test "when operations are +7, +7, -2, -7, -4, the first duplicate is 14" do
    assert Duplicate.find([+7, +7, -2, -7, -4]) == 14
  end
end
