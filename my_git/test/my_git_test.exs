defmodule MyGitTest do
  use ExUnit.Case
  doctest MyGit

  test "greets the world" do
    assert MyGit.hello() == :world
  end
end
