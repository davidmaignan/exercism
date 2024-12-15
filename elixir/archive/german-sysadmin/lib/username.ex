defmodule Username do

  def sanitize(''), do: ''

  def sanitize(username) do
    [first_letter | tail] = username

    convert(first_letter) ++ sanitize(tail)
  end

  defp convert(letter) do
    case letter do
      ?ä -> 'ae'
      ?ö -> 'oe'
      ?ü -> 'ue'
      ?ß -> 'ss'
      ?_ -> '_'
      letter when letter >=97 and letter <= 122 -> [letter]
      _ -> []
    end
  end
end
