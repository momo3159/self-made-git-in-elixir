defmodule ByteSwappingTest do
  alias MyGit.BinaryFormat.Util.ByteSwapping

  use ExUnit.Case, async: false

  describe "ネットワークオーダーからリトルエンディアンへの変換" do
    test("引数が0byteのバイナリ") do
      assert ByteSwapping.network_to_little_endian(<<>>) == <<>>
    end

    test("引数が1byteのバイナリ") do
      assert ByteSwapping.network_to_little_endian(<<14>>) == <<14>>
    end

    test("引数が2byte以上のバイナリ") do
      assert ByteSwapping.network_to_little_endian(<<0, 14, 15, 19, 255>>) == <<255, 19, 15, 14, 0>>
    end

    test("引数がバイナリではない場合") do
      assert_raise(ArgumentError, fn -> ByteSwapping.network_to_little_endian(<<0::1>>) end)
      assert_raise(ArgumentError, fn -> ByteSwapping.network_to_little_endian(<<0, 1::7>>) end)
    end

  end
end
