defmodule BoutiqueSuggestions do

  @defaults %{maximum_price: 100}
  def get_combinations([], _, options \\ [])
  do
    []
  end

  def get_combinations(tops, bottoms, options)
  do
    options = Enum.into(options, @defaults)
    [head | tail] = tops
    get_combis(head, bottoms, options) ++ get_combinations(tail, bottoms, options)
  end

  def get_combis(a, [], options \\ [])
  do
    []
  end

  def get_combis(%{base_color: color} = a,
      [%{base_color: color2} = head | tail], options)
      when color == color2
  do
    get_combis(a, tail, options)
  end

  def get_combis(%{base_color: color} = a, [%{base_color: color2} = head | tail], options)
  do
    if options[:maximum_price] > (a.price + head.price) do
      [{a, head}] ++ get_combis(a, tail, options)
    else
      get_combis(a, tail, options)
    end
  end

end
