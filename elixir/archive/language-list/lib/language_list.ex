defmodule LanguageList do
  def new() do
    []
  end

  def add(list, language) do
    [language | list]
  end

  def remove(list) do
    list -- [first(list)]
  end

  def first(list) do
    [head | _ ] = list
    head
  end

  def count(list) do
    List.foldl(list, 0, fn _, acc -> acc + 1 end)
  end

  def functional_list?(list) do
    "Elixir" in list
  end
end
