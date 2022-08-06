defmodule InitCommandTest do
  use ExUnit.Case, async: false

  import Mock
  alias MyGit.Command.Init

  describe "Gitレポジトリの初期化処理" do
    setup_with_mocks([
      {
        File,
        [],
        [
          ls!: fn _path -> [] end,
          cwd!: fn -> "/Users/testUser/project" end,
          mkdir!: fn _path -> :ok end,
          touch!: fn _path -> :ok end,
          write!: fn _path, content -> :ok end
        ]
      },
      {
        IO,
        [],
        [puts: fn str -> :ok end]
      }
    ]) do
      on_exit(fn ->
        :meck.unload()
      end)

      :ok
    end

    test "作成したことを示すメッセージが正しい" do
      Init.init()
      assert_called(IO.puts("Initialized empty Git repository in /Users/testUser/project/.git"))
    end
  end

  describe "Gitレポジトリの再初期化処理" do
    setup_with_mocks([
      {
        File,
        [],
        [
          ls!: fn _path -> [".git"] end,
          cwd!: fn -> "/Users/testUser/project" end,
          mkdir!: fn _path -> :ok end,
          touch!: fn _path -> :ok end,
          write!: fn _path, content -> :ok end,
          rm_rf!: fn _path -> :ok end
        ]
      },
      {
        IO,
        [],
        [puts: fn str -> :ok end]
      }
    ]) do
      on_exit(fn ->
        :meck.unload()
      end)

      :ok
    end

    test "既存の.gitレポジトリが削除される" do
      Init.init()
      assert_called(File.rm_rf!("/Users/testUser/project/.git"))
    end

    test "再初期化したことを示すメッセージが正しい" do
      Init.init()

      assert_called(
        IO.puts("Reinitialized existing Git repository in /Users/testUser/project/.git")
      )
    end
  end
end
