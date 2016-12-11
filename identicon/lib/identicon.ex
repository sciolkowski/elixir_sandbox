defmodule Identicon do

  @doc """
    This function is responsible for running whole process of generating an Identicon
  """
  def main(input) do
      input
      |> hash_input
      |> pick_color
  end

  @doc """
    Chages simple string into list of binary values
  """
  def hash_input(input) do
    hex = :crypto.hash(:md5, input)
    |> :binary.bin_to_list

    %Identicon.Image{hex: hex}
  end

  def pick_color(%Identicon.Image{hex: [r, g, b | _tail]} = image) do
    %Identicon.Image{image | color: {r,g,b}}
  end

end
