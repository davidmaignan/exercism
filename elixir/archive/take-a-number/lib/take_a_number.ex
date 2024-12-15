defmodule TakeANumber do

  def count do
    loop(0)
  end

  defp loop(n) do
    receive do
      {:report_state, from_pid} ->
        send from_pid, n
        loop(n)
      {:take_a_number, from_pid} ->
          send from_pid, n + 1
          loop(n+1)
      {:stop, from_pid} ->
          Process.exit(self(), :halt)
      _ ->
        loop(n)
    end
  end

  def start() do
    pid = spawn(TakeANumber, :count, [])

    pid
  end
end
