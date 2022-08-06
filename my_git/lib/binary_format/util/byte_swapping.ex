defmodule MyGit.BinaryFormat.Util.ByteSwapping do
  def byte_swapping(<<>>) do
    <<>>
  end

  def byte_swapping(<<x::8>>) do
    <<x>>
  end

  def byte_swapping(b) do
    if not is_binary(b) do
      raise ArgumentError, message:  "the argument is not binary."
    end

    size = byte_size(b)

    for i <- (size-1)..0//-1 do
      binary_part(b, i, 1)
    end
    |> Enum.reduce(fn x, acc -> acc <> x end)
  end
end
