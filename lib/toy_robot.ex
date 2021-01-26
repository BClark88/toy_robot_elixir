defmodule ToyRobot.Robot do
  defstruct north: 0, east: 0, facing: :north
  alias ToyRobot.Robot

  @moduledoc """

  Documentation for `ToyRobot`.
  """

  @doc """
  Turns the robot left.

  ## Examples

      iex> alias ToyRobot.Robot
      ToyRobot.Robot
      iex> robot = %Robot{facing: :north}
      %Robot{facing: :north}
      iex> robot |> Robot.turn_left
      %Robot{facing: :west}
  """

  def turn_left(%Robot{facing: facing} = robot) do
    case facing do
      :north -> %Robot{robot | facing: :west}
      :south -> %Robot{robot | facing: :east}
      :east -> %Robot{robot | facing: :north}
      :west -> %Robot{robot | facing: :south}
    end
  end

  @doc """
  Turns the robot right.

  ## Examples

      iex> alias ToyRobot.Robot
      ToyRobot.Robot
      iex> robot = %Robot{facing: :north}
      %Robot{facing: :north}
      iex> robot |> Robot.turn_right
      %Robot{facing: :east}
  """

  def turn_right(%Robot{facing: facing} = robot) do
    case facing do
      :north -> %Robot{robot | facing: :east}
      :south -> %Robot{robot | facing: :west}
      :east -> %Robot{robot | facing: :south}
      :west -> %Robot{robot | facing: :north}
    end
  end

  @doc """
  ## Moves the robot
     iex> alias ToyRobot.Robot
     ToyRobot.Robot
     iex> robot = %Robot{north: 0, facing: :north}
     %Robot{north: 0, facing: :north}
     iex> robot |> Robot.move
     %Robot{north: 1, east: 0, facing: :north}
  """

  def move(%Robot{facing: facing} = robot) do
    case facing do
      :north -> robot |> move_north
      :south -> robot |> move_south
      :east -> robot |> move_east
      :west -> robot |> move_west
    end
  end

  defp move_east(robot) do
    %Robot{east: robot.east + 1}
  end

  defp move_west(robot) do
    %Robot{east: robot.east - 1}
  end

  defp move_north(robot) do
    %Robot{north: robot.north + 1}
  end

  defp move_south(robot) do
    %Robot{north: robot.north - 1}
  end
end
