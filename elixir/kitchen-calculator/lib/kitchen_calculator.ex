defmodule KitchenCalculator do
  def get_volume({_, volume}) do
    volume
  end

  def to_milliliter({:cup, volume}) do {:milliliter, volume * 240} end
  def to_milliliter({:fluid_ounce, volume}) do {:milliliter, volume * 30} end
  def to_milliliter({:teaspoon, volume}) do {:milliliter, volume * 5} end
  def to_milliliter({:tablespoon, volume}) do {:milliliter, volume * 15} end
  def to_milliliter({:milliliter, volume}) do {:milliliter, volume} end

  def from_milliliter({:milliliter, volume}, :cup = unit) do {unit, volume / 240} end
  def from_milliliter({:milliliter, volume}, :fluid_ounce = unit) do {unit, volume / 30} end
  def from_milliliter({:milliliter, volume}, :teaspoon = unit) do {unit, volume / 5} end
  def from_milliliter({:milliliter, volume}, :tablespoon = unit) do {unit, volume / 15} end
  def from_milliliter({:milliliter, volume}, :milliliter = unit) do {unit, volume} end

  def convert(volume_pair, unit) do
    from_milliliter(to_milliliter(volume_pair), unit)
  end
end
