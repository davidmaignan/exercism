defmodule FreelancerRates do

  @daily_rate 8.0
  @monthly_billable_days 22

  def daily_rate(hourly_rate) do
    hourly_rate * @daily_rate
  end

  def apply_discount(before_discount, discount) do
    before_discount * (100 - discount) / 100
  end

  defp discounted_daily_rate(hourly_rate, discount) do
    hourly_rate
    |> apply_discount(discount)
    |> daily_rate
  end

  def monthly_rate(hourly_rate, discount) do
    discounted_daily_rate(hourly_rate, discount)
    * @monthly_billable_days
    |> ceil
  end

  def days_in_budget(budget, hourly_rate, discount) do
    daily_rate = discounted_daily_rate(hourly_rate, discount)
    budget / daily_rate
    |> Float.floor(1)
  end
end
