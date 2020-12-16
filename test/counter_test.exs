defmodule CounterTest do
  use ExUnit.Case

  test "increments by 1" do
    assert Counter.Counter.inc(0) == 1
    assert Counter.Counter.inc(8) == 9
  end
end
