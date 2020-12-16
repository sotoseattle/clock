defmodule Clock do
  alias Counter.Counter

  def start do
    pido = Counter.start()
    run(pido)
  end

  def run(pido) do
    :timer.sleep(1000)
    Counter.tick(pido)

    n = Counter.state(pido)
    IO.puts "... #{n}"

    run(pido)
  end


end

# fun = (fn x -> IO.puts "Seconds: #{x}" end)
# Clock.start()
