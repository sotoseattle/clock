defmodule Counter.Server do
  alias Counter.Counter

  # Stores the value
  def run(count) do
    new_count = listen(count)
    run(new_count)
  end

  # Listens for messages
  def listen(count) do
    receive do
      {:tick, _from} ->
        Counter.inc(count)
      {:state, from} ->
        send(from, {:count, count})
        count
    end
  end
end
