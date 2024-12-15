defmodule RPG.CharacterSheet do
  def welcome() do
    IO.puts("Welcome! Let's fill out your character sheet together.")
    # Please implement the welcome/0 function
  end

  def ask_name() do
    IO.gets("What is your character's name?\n") |> String.trim
  end

  def ask_class() do
    IO.gets("What is your character's class?\n") |> String.trim
  end

  def ask_level() do
    IO.gets("What is your character's level?\n")
    |> String.trim
  end

  def run() do
    welcome()
    name = ask_name() |> String.trim
    class = ask_class() |> String.trim
    level = ask_level() |> String.trim
    character = %{class: class, level: level, name: name}

    # Please implement the run/0 function
  end
end
