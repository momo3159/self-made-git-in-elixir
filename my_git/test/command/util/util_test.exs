defmodule Command.UtilTest do
  use ExUnit.Case, async: false

  alias MyGit.Command.Util

  describe "文字列がsha-1のフォーマットかどうかを検証する" do
    test("引数がsha-1 形式の文字列の場合trueを返す") do
      assert Util.is_sha_1?("4aa797e9e1e3e0e3c50cf2397df6779f3bfe168a")
    end

    test("引数がsha-1形式の文字列でない場合falseを返す") do
      assert(not Util.is_sha_1?("テスト"))
      # 39文字
      assert(not Util.is_sha_1?("4aa797e9e1e3e0e3c50cf2397df6779f3bfe168"))
      # 無効な文字(g)が含まれている
      assert(not Util.is_sha_1?("4ga797e9e1e3e0e3c50cf2397df6779f3bfe168a"))
    end
  end

  describe "文字列が有効なブランチ名かどうかを検証する" do
    test("有効な場合trueを返す") do
      assert Util.is_valid_branch_name?("test")
      assert Util.is_valid_branch_name?("test/あ")
      assert Util.is_valid_branch_name?("test/あ　")
      assert Util.is_valid_branch_name?("　")
      assert Util.is_valid_branch_name?("test.yay")
    end

    test("先頭が不正な文字ならfalseを返す") do
      assert(not Util.is_valid_branch_name?("/yay"))
      assert(not Util.is_valid_branch_name?("."))
    end

    test("末尾が不正な文字ならfalseを返す") do
      assert(not Util.is_valid_branch_name?("test/"))
      assert(not Util.is_valid_branch_name?("test.lock"))
      assert(not Util.is_valid_branch_name?("test."))
    end

    test("無効な文字列が含まれているならfalseを返す") do
      assert(not Util.is_valid_branch_name?("test@{/hioge"))
      assert(not Util.is_valid_branch_name?("test*"))
    end
  end

  describe "HEADファイルの中身が正しいかどうかを検証する" do
    test "ref: refs/heads/から始まっている" do
    end

    test("deatched HEAD") do
    end
  end
end
