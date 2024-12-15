defmodule Lasagna do
  def expected_minutes_in_oven do
    40
  end

  def remaining_minutes_in_oven(arg) do
    expected_minutes_in_oven() - arg
  end

  def preparation_time_in_minutes(arg) do
    arg * 2
  end

  def total_time_in_minutes(nb_layers, time_oven) do
    preparation_time_in_minutes(nb_layers) + time_oven
  end

  def alarm() do
    "Ding!"
  end
end

IO.puts Lasagna.expected_minutes_in_oven()
IO.puts Lasagna.remaining_minutes_in_oven(30)
IO.puts Lasagna.preparation_time_in_minutes(30)
IO.puts Lasagna.total_time_in_minutes(3, 5)
