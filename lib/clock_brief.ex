defmodule ClockBrief do
  alias Counter.Server

  def start do
    pido = spawn(fn -> Server.run(0) end)
    run(pido)
  end

  def run(pido) do
    :timer.sleep(1000)
    tick(pido)

    n = tock(pido)
    IO.puts "... #{n}"

    run(pido)
  end

  defp tick(pid) do
    send(pid, {:tick, self()})
  end

  defp tock(pid) do
    send(pid, {:state, self()})
    receive do
      {:count, value} -> value
    end
  end
end


# Although this is brief and clear, the point they are trying to make
# is that you should separate the code in layers.
# The clock should not send messages to the server, nor receive. That
# should be left to a secondary layer.
# The same way, the server should not know anything about the business
# logic and concern itself only with messages passed back and forth
