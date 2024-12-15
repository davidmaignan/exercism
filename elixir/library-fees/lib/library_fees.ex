defmodule LibraryFees do
  def datetime_from_string(string) do
    {_, date} = NaiveDateTime.from_iso8601(string)
    date
  end

  def before_noon?(datetime) do
    datetime.hour < 12
  end

  def return_date(checkout_datetime) do
    case before_noon?(checkout_datetime) do
      true -> checkout_datetime |> Date.add(28)
      false -> checkout_datetime |> Date.add(29)
    end
  end

  def days_late(planned_return_date, actual_return_datetime) do
    actual_return_datetime
    |> Date.diff(planned_return_date)
    |> max(0)
  end

  def monday?(datetime) do
    datetime
    |> Date.day_of_week()
    |> (&(&1 == 1)).()
  end

  def calculate_late_fee(checkout, return, rate) do
    return_date = return |> datetime_from_string()
    discount = if return_date |> monday?(), do: 2, else: 1

    checkout
    |> datetime_from_string()
    |> return_date()
    |> days_late(return_date)
    |> Kernel.*(rate)
    |> Kernel.div(discount)
    |> floor()
  end
end
