defmodule Identicon do

  @doc """
    This function is responsible for running whole process of generating an Identicon
  """
  def main(input) do
      input
      |> hash_input
      |> pick_color
      |> build_grid
      |> filter_odd_squares
  end

  @doc """
    Chages simple string into list of binary values
  """
  def hash_input(input) do
    hex = :crypto.hash(:md5, input)
    |> :binary.bin_to_list

    %Identicon.Image{hex: hex}
  end

  @doc """
    Sets the color of Identicon
  """
  def pick_color(%Identicon.Image{hex: [r, g, b | _tail]} = image) do
    %Identicon.Image{image | color: {r,g,b}}
  end

  @doc """
    Manipulate list of numbers to create a 5x5 symmetric grid
  """
  def build_grid(%Identicon.Image{hex: hex} = image) do
    grid =
      hex
      |> Enum.chunk(3)
      |> Enum.map(&mirror_row/1)
      |> List.flatten
      |> Enum.with_index

    %Identicon.Image{image | grid: grid}
  end

  @doc """
    Helper function for mirrioring rows
  """
  def mirror_row(row) do
    # [145, 46, 200]
    [first, second | _tail] = row
    row ++ [second, first]
    # [145, 46, 200, 46, 145]
  end

  def filter_odd_squares(%Identicon.Image{grid: grid} = image) do
    grid = Enum.filter grid, fn({code, _index}) ->
      rem(code, 2) == 0
    end

    %Identicon.Image{image | grid: grid}
  end
end
