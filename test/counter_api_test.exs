defmodule CounterApiTest do
  use ExUnit.Case
  alias Counter.Counter

  test "" do
    pido = Counter.start
    n = :random.uniform(10)

    (1..n)
    |> Enum.to_list
    |> Enum.each(fn _x -> Counter.tick(pido) end)

    assert Counter.state(pido) == n
  end
end
