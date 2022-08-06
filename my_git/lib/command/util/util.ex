defmodule MyGit.Command.Util do
  def get_HEAD(gitRepoPath) do
    head = File.read!("#{gitRepoPath}/HEAD")
  end

  def get_current_branch() do
  end

  def check_HEAD(head) do
    cond do
      is_sha_1?(head) ->
        {:ok, :commit_hash}

      String.starts_with?(head, "ref: refs/heads/") ->
        branch_name =
          String.split(head, "ref: refs/heads/")
          |> Enum.at(1)

        if branch_name != nil and is_valid_branch_name?(branch_name) do
          {:ok, :branch_path}
        else
          {:error, "HEAD is invalid."}
        end

      true ->
        {:error, "HEAD is invalid."}
    end
  end

  def is_sha_1?(str) do
    {:ok, sha1_pattern} = Regex.compile("[0-9a-f]{40}")
    Regex.match?(sha1_pattern, str)
  end

  def is_valid_branch_name?(name) do
    """
    詳細は以下のコマンド・リンクなど
      - man git-check-ref-format
      - https://zenn.dev/sekken/articles/bc119e76679a0755849b
      - https://qiita.com/hnw/items/f8009cf36e121e78ec50
    今回は面倒なので，一旦単純化する.
    """
    
    not (name == "@" or
           name == "" or
           String.starts_with?(name, [".", "/"]) or
           String.contains?(name, [" ", "~", "^", ":", "?", "*", "[", "\\", "@{", "//"]) or
           String.ends_with?(name, [".", "/", ".lock"]))
  end
end
