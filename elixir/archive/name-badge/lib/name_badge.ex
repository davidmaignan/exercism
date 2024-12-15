defmodule NameBadge do
  def print(id, name, departement) do
    result = "#{name}"
      |> Kernel.<> " - "
      |> Kernel.<> String.upcase(departement || "owner")

      if is_nil(id) do
        result
      else
        "[#{id}] - " <> result
      end
  end
end
