defmodule BasketballWebsite do
  def extract_from_path(data, path) do
    [head | tail] = String.split(path, ".")

    extract(tail, head, data[head])
  end

  defp extract([head | tail], _, data) do
    extract(tail, head, data[head])
  end

  defp extract([], _, data) do
    data
  end


  def get_in_path(data, path) do
    paths = String.split(path, ".")

    Kernel.get_in(data, paths)
  end
end
