defmodule LanguageList do
  def new() do
    []
  end

  def add(list, language) do
    [language | list]
  end

  def remove([_head | tail]) do
    tail
  end

  def first([head | _tail]) do
    head
  end

  def count([]), do: 0

  def count([_head | tail]) do
    1 + count(tail)
  end

  def functional_list?([]), do: false

  def functional_list?([head | tail]) do
    "Elixir" == head or functional_list?(tail)
  end
end
