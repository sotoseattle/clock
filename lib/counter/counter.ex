defmodule Counter.Counter do
  alias Counter.Server

  def start do
    spawn(fn -> Server.run(0) end)
  end

  def tick(pid) do
    send(pid, {:tick, self()})
  end

  def state(pid) do
    send(pid, {:state, self()})
    receive do
      {:count, value} -> value
    end
  end

  def inc(n), do: n+1
end
