defmodule LibraryFees do
  # alias String.Chars.NaiveDateTime
  # alias String.Chars.NaiveDateTime
  def datetime_from_string(string) do
    {_, date } = NaiveDateTime.from_iso8601(string)
    date
  end

  def before_noon?(datetime) do
      datetime.hour < 12
  end

  def return_date(checkout_datetime) do
    days = if before_noon?(checkout_datetime), do: 28, else: 29

    Date.add(checkout_datetime, days)
  end

  def days_late(planned_return_date, actual_return_datetime) do
    {_, actual_date} =
      Date.new(
        actual_return_datetime.year,
        actual_return_datetime.month,
        actual_return_datetime.day)

    Date.diff(planned_return_date, actual_date)
    |> min(0)
    |> abs
  end

  def monday?(datetime) do
    datetime
    |> NaiveDateTime.to_date
    |> Date.day_of_week == 1
  end

  def calculate_late_fee(checkout, return, rate) do
    return_date = datetime_from_string(return)
    discount_rate = if monday?(return_date), do: rate / 2, else: rate

      checkout
      |> datetime_from_string
      |> return_date
      |> days_late(return_date)
      |> Kernel.*(discount_rate)
      |> floor
  end
end
