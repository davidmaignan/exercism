defmodule CaptainsLog do
  @planetary_classes ["D", "H", "J", "K", "L", "M", "N", "R", "T", "Y"]

  def random_planet_class() do
    Enum.random(@planetary_classes)
  end

  def random_ship_registry_number() do
    "NCC-#{Enum.random(1000..9999)}"
  end

  def random_stardate() do
    (:rand.uniform() + 41) * 1000
  end

  def format_stardate(stardate) do
    to_string(:io_lib.format("~.1f", [stardate]))
  end
end
