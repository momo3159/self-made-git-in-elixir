defmodule MyGit do
  @moduledoc """
  Documentation for `MyGit`.
  """

  def main(args) do
    """
    args: 文字列の配列
    例）my_git add hoge.txt → ["add", "hoge.txt"]
    """

    if length(args) == 0 do
      raise "引数がありません．"
    end

    case hd(args) do
      "init" -> ""
      "add" -> ""
      "commit" -> ""
      "log" -> ""
      "status" -> ""
      _ -> raise "そのようなコマンドはありません"
    end
  end
end
