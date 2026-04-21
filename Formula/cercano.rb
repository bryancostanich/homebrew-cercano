class Cercano < Formula
  desc "AI-powered development tool with local/cloud model routing"
  homepage "https://github.com/bryancostanich/Cercano"
  version "0.9.2"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/bryancostanich/Cercano/releases/download/v#{version}/cercano-darwin-arm64"
      sha256 "f38a51697085d6a7881bd4c3b51e46cd6989b5e6f3266cd99044de70a384bbf5"
    else
      url "https://github.com/bryancostanich/Cercano/releases/download/v#{version}/cercano-darwin-amd64"
      sha256 "ac3597f76e5251393cbddfc310eaefee65916d108767db396ea791d59e0a4da3"
    end
  end

  on_linux do
    url "https://github.com/bryancostanich/Cercano/releases/download/v#{version}/cercano-linux-amd64"
    sha256 "f6011624e5f523dd99b18da66f683d058588a55fba28687237ee9729ad29dce4"
  end

  def install
    binary = Dir.glob("cercano-*").first || "cercano"
    bin.install binary => "cercano"
  end

  def caveats
    <<~EOS
      Cercano requires Ollama for local AI inference.
      Install it from https://ollama.com/ then run:

        cercano setup

      To use with Claude Code:

        claude mcp add cercano -- cercano --mcp
    EOS
  end

  test do
    assert_match "cercano v", shell_output("#{bin}/cercano --version")
  end
end
