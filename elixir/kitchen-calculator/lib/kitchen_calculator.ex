defmodule KitchenCalculator do
  def get_volume({_, v}) do
    v
  end

  def to_milliliter({:milliliter, v}) do
    {:milliliter, v}
  end

  def to_milliliter({:cup, v}) do
    {:milliliter, v * 240 }
  end

  def to_milliliter({:fluid_ounce, v}) do
    {:milliliter, v * 30}
  end

  def to_milliliter({:teaspoon, v}) do
    {:milliliter, v * 5}
  end

  def to_milliliter({:tablespoon, v}) do
    {:milliliter, v * 15}
  end

  def from_milliliter({:milliliter, v}, :milliliter) do
    {:milliliter, v}
  end

  def from_milliliter({:milliliter, v}, :cup) do
    {:cup, v / 240}
  end

  def from_milliliter({:milliliter, v}, :fluid_ounce) do
    {:fluid_ounce, v / 30}
  end

  def from_milliliter({:milliliter, v}, :teaspoon) do
    {:teaspoon, v / 5}
  end

  def from_milliliter({:milliliter, v}, :tablespoon) do
    {:tablespoon, v / 15}
  end

  def convert(volume_pair, unit) do
    from_milliliter(to_milliliter(volume_pair), unit)
  end
end
