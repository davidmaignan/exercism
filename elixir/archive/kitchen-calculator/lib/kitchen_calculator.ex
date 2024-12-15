defmodule KitchenCalculator do
  @cup 240
  @fluid_ounce 30
  @teaspoon 5
  @tablespoon 15

  def get_volume({_, volume}) do
    volume
  end

  def to_milliliter({:milliliter, volume}) do
    {:milliliter, volume}
  end

  def to_milliliter({:cup, volume}) do
    {:milliliter, volume * @cup}
  end

  def to_milliliter({:fluid_ounce, volume}) do
    {:milliliter, volume * @fluid_ounce}
  end

  def to_milliliter({:teaspoon, volume}) do
    {:milliliter, volume * @teaspoon}
  end

  def to_milliliter({:tablespoon, volume}) do
    {:milliliter, volume * @tablespoon}
  end

  def from_milliliter({:milliliter, volume}, :milliliter) do
    {:milliliter, volume}
  end

  def from_milliliter({:milliliter, volume}, :cup) do
    {:cup, volume / @cup}
  end

  def from_milliliter({:milliliter, volume}, :fluid_ounce) do
    {:fluid_ounce, volume / @fluid_ounce}
  end

  def from_milliliter({:milliliter, volume}, :teaspoon) do
    {:teaspoon, volume / @teaspoon}
  end

  def from_milliliter({:milliliter, volume}, :tablespoon) do
    {:tablespoon, volume / @tablespoon}
  end

  def convert(from, to) do
    from_milliliter(to_milliliter(from), to)
  end
end
