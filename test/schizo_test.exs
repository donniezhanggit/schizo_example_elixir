defmodule SchizoTest do
  use ExUnit.Case
  doctest Schizo

  test "uppercase doesnt change the first word" do
    assert(Schizo.uppercase("foo") === "foo")
  end

  test "uppercase converts the second word to uppercase" do
    assert(Schizo.uppercase("foo bar") == "foo BAR")
  end

  test "uppercase converts every other word to uppercase" do
    assert(Schizo.uppercase("foo bar baz whee") == "foo BAR BAZ WHEE")
  end
end
