defmodule RPG.CharacterSheet do
  @welcome "Welcome! Let's fill out your character sheet together."
  @ask_name "What is your character's name?\n"
  @ask_class "What is your character's class?\n"
  @ask_level "What is your character's level?\n"

  def welcome() do
    IO.puts @welcome
  end

  def ask_name() do
    IO.gets(@ask_name)
    |> String.trim
  end

  def ask_class() do
    IO.gets(@ask_class)
    |> String.trim
  end

  def ask_level() do
    IO.gets(@ask_level)
    |> String.trim
    |> String.to_integer
  end

  def run() do
    welcome()
    name = ask_name()
    class = ask_class()
    level = ask_level()

    %{name: name, class: class, level: level}
    |> IO.inspect(label: "Your character")
  end
end
