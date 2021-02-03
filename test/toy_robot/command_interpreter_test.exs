defmodule ToyRobot.CommandInterpreterTest do
  use ExUnit.Case
  doctest ToyRobot.CommandInterpreter
  alias ToyRobot.CommandInterpreter

  test "marks invalid commands as invalid" do
    commands = ["SPIN", "TWIRL", "EXTERMINATE"]
    output = commands |> CommandInterpreter.interpret()

    assert output == [
             {:invalid, "SPIN"},
             {:invalid, "TWIRL"},
             {:invalid, "EXTERMINATE"}
           ]
  end
end
