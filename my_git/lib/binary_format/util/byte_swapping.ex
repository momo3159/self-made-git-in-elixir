defmodule MyGit.BinaryFormat.Util.ByteSwapping do
  def network_to_little_endian(<<>>) do
    <<>>
  end

  def network_to_little_endian(<<x::8>>) do
    <<x>>
  end

  def network_to_little_endian(b) do
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
