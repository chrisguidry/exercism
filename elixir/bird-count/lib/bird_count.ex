defmodule BirdCount do
  def today([]), do: nil
  def today([today | _earlier]), do: today

  def increment_day_count([]), do: [1]
  def increment_day_count([today | earlier]), do: [today + 1 | earlier]

  def has_day_without_birds?([]), do: false
  def has_day_without_birds?([today | earlier]) do
    today == 0 or has_day_without_birds?(earlier)
  end

  def total([]), do: 0
  def total([today | earlier]), do: today + total(earlier)

  def busy_days([]), do: 0
  def busy_days([today | earlier]) do
    (if today >= 5 do 1 else 0 end) + busy_days(earlier)
  end
end
