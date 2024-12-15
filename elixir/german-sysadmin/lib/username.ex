defmodule Username do
  def sanitize([]), do: []

  def sanitize([head | tail]) do
    case head do
      ?_ -> [head | sanitize(tail)]
      head when head >= ?a and head <= ?z -> [head | sanitize(tail)]
      ?ä -> [?a, ?e | sanitize(tail)]
      ?ö -> [?o, ?e | sanitize(tail)]
      ?ü -> [?u, ?e |  sanitize(tail)]
      ?ß -> [?s, ?s | sanitize(tail)]
      _ -> sanitize(tail)
    end
  end
end
