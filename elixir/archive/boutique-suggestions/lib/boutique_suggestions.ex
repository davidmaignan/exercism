defmodule BoutiqueSuggestions do

  @max_price 100
  def get_combinations(tops, bottoms, options \\ []) do
    maximum_price = Keyword.get(options, :maximum_price, @max_price)

    for top <- tops, bottom <- bottoms,
      top.base_color != bottom.base_color
      and maximum_price > (top.price + bottom.price)
    do
        {top, bottom}
    end
  end

end
