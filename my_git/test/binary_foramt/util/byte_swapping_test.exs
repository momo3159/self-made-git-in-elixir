defmodule ByteSwappingTest do
  alias MyGit.BinaryFormat.Util.ByteSwapping

  use ExUnit.Case, async: false

  describe "エンディアンへの変換" do
    test("引数が0byteのバイナリ") do
      assert ByteSwapping.byte_swapping(<<>>) == <<>>
    end

    test("引数が1byteのバイナリ") do
      assert ByteSwapping.byte_swapping(<<14>>) == <<14>>
      assert ByteSwapping.byte_swapping(<<256>>) == <<0>>
    end

    test("引数が2byte以上のバイナリ") do
      assert ByteSwapping.byte_swapping(<<0, 14, 15, 19, 255>>) == <<255, 19, 15, 14, 0>>
      assert ByteSwapping.byte_swapping(<<255, 19, 15, 14, 0>>) == <<0, 14, 15, 19, 255>>
      assert ByteSwapping.byte_swapping(<<257, 0>>) == <<0, 1>>
      assert ByteSwapping.byte_swapping(<<0, 257>>) == <<1, 0>>
    end

    test("引数がバイナリではない場合") do
      assert_raise(ArgumentError, fn -> ByteSwapping.byte_swapping(<<0::1>>) end)
      assert_raise(ArgumentError, fn -> ByteSwapping.byte_swapping(<<0, 1::7>>) end)
    end

  end
end
