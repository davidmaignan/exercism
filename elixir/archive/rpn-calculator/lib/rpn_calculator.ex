defmodule RPNCalculator do
  def calculate!(stack, operation) do
    operation.(stack)
  end

  def calculate(stack, operation) do
    try do
      raise RuntimeError, "error"
    rescue
      e in RuntimeError -> :error
    end
  end

  def calculate_verbose(stack, operation) do
    # Please implement the calculate_verbose/2 function
  end
end
