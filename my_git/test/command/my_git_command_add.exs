defmodule AddCommandTest do
  use ExUnit.Case, async: false

  alias MyGit.Command.Add

  import Mock

  describe "コマンドの引数に何も指定されない時" do
    test("「Nothing specified, nothing added.」というメッセージを出す") do
      
    end
  end

  describe "コマンドの引数にファイルが1つ指定された時" do
    describe "ファイルが存在しない場合" do
      test("「fatal: pathspec 指定したパス did not any match file」というエラーメッセージを出す") do

      end
    end

    describe "ファイルが存在する場合" do
      test("blobオブジェクトが生成されている") do

      end

      test("indexに指定したファイルが登録されている") do

      end
    end

    describe "ファイルがレポジトリ外の場合" do
      test("「fatal: 指定したファイルパス is outside repository at レポジトリパス」エラ〜メッセージを出す") do

      end
    end
  end

  describe "コマンドの引数にファイルが2つ以上指定された時" do
    test("blobオブジェクトが生成されている") do

    end

    test("indexに指定したファイルが登録されている") do

    end
  end

  describe "コマンドの引数にディレクトリが1つ指定された時"　do
    test("ディレクトリ配下のファイルのblobオブジェクトが生成されている") do

    end

    test("indexに指定したディレクトリ配下のファイルが登録されている") do

    end
  end

  describe "コマンドの引数にディレクトリが2つ指定された時" do
    test("ディレクトリ配下のファイルのblobオブジェクトが生成されている") do

    end

    test("indexに指定したディレクトリ配下のファイルが登録されている") do

    end
  end

  describe "コマンドの引数にディレクトリとファイルの両方が含まれるとき" do
    test("全てのファイルのblobオブジェクトが生成されている") do

    end

    test("すべてのファイルが登録されている") do

    end

  end

  describe "コマンドの引数に「.」が指定された時" do
    test("gitレポジトリ配下のblobオブジェクトが生成されている") do

    end

    test("gitレポジトリ配下のファイルが登録されている") do

    end
  end
end
