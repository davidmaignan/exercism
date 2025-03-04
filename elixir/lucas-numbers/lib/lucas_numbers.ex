defmodule LucasNumbers do
  @moduledoc """
  Lucas numbers are an infinite sequence of numbers which build progressively
  which hold a strong correlation to the golden ratio (φ or ϕ)

  E.g.: 2, 1, 3, 4, 7, 11, 18, 29, ...
  """

  def generate(count) when is_binary(count) or count < 1,
    do: raise(ArgumentError, message: "count must be specified as an integer >= 1")

  def generate(1), do: [2]
  def generate(2), do: [2, 1]

  def generate(count) do
    {2, 1}
    |> Stream.unfold(fn {acc, next} -> {acc, {next, acc + next}} end)
    |> Enum.take(count)
  end
end
