defmodule BoutiqueInventory do

  def sort_by_price(inventory) do
    Enum.sort_by(inventory, &(&1.price))
  end

  def with_missing_price(inventory) do
    Enum.filter(inventory, &(&1.price == nil))
  end

  def update_names(inventory, old_word, new_word) do
    Enum.map(inventory, &%{&1 | name: String.replace(&1.name, old_word, new_word)})
  end

  def increase_quantity(item, count) do
    Map.update!(item, :quantity_by_size, fn value ->
      Map.new(value, fn({size, value}) -> {size, value + count} end)
    end)
  end

  def update_quantity(quantity, count) do
    quantity
    |> Enum.map(fn({size, qte}) -> {size, qte + count} end)
    |> Enum.into(%{})

  end

  def total_quantity(item) do
    item
    |> Map.get(:quantity_by_size, %{})
    |> Enum.reduce(0, fn ({_, v}, acc) -> acc + v end)
  end
end
