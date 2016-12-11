defmodule Identicon do

  @doc """
    This function is responsible for running whole process of generating an Identicon
  """
  def main(input) do
      input
      |> hash_input
  end

  @doc """
    Chages simple string into list of binary values
  """
  def hash_input(input) do
    hex = :crypto.hash(:md5, input)
    |> :binary.bin_to_list

    %Identicon.Image{hex: hex}
  end

end
