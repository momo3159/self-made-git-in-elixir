defmodule Init do
  def init() do
    currentDirPath = File.cwd!()
    gitRepositoryPath = "#{currentDirPath}/.git"
    files = File.ls!(currentDirPath)

    successMessage =
      if Enum.member?(files, ".git") do
        # reinitialize
        File.rm_rf!(gitRepositoryPath)
        "Reinitialized existing Git repository in #{gitRepositoryPath}"
      else
        "Initialized empty Git repository in #{gitRepositoryPath}"
      end

    makeGitRepository(currentDirPath)
    makeObjectsDir(gitRepositoryPath)
    makeRefsDir(gitRepositoryPath)
    touchHEADFile(gitRepositoryPath)
    touchConfigFile(gitRepositoryPath)
    touchDescriptionFile(gitRepositoryPath)

    IO.puts(successMessage)
  end

  defp makeGitRepository(path) do
    File.mkdir!("#{path}/.git")
  end

  defp touchHEADFile(path) do
    File.touch!("#{path}/HEAD")
    File.write!("#{path}/HEAD", "ref: refs/heads/master")
    # TODO: HEADにref: refs/heads/masterを書き込む
  end

  defp touchConfigFile(path) do
    """
    [core]
      repositoryformatversion = 0
      filemode = true
      bare = false
      logallrefupdates = true
      ignorecase = true
      precomposeunicode = true
    """

    File.touch!("#{path}/config")
    # TODO: 初期値を書き込む
  end

  defp touchDescriptionFile(path) do
    File.touch("#{path}/description")
    # Unnamed repository; edit this file 'description' to name the repository.
  end

  defp makeObjectsDir(path) do
    File.mkdir!("#{path}/objects")
    File.mkdir!("#{path}/objects/info")
  end

  defp makeRefsDir(path) do
    File.mkdir!("#{path}/refs")
    File.mkdir!("#{path}/refs/heads")
    File.mkdir!("#{path}/refs/tags")
  end
end
