class Cercano < Formula
  desc "AI-powered development tool with local/cloud model routing"
  homepage "https://github.com/bryancostanich/Cercano"
  version "0.9.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/bryancostanich/Cercano/releases/download/v#{version}/cercano-darwin-arm64"
      sha256 "39731a86e67ae8cbc8cb1e4144d5540a8df3b499d525462444f7727924290757"
    else
      url "https://github.com/bryancostanich/Cercano/releases/download/v#{version}/cercano-darwin-amd64"
      sha256 "e23c6f2f86449e526f4e1863e11453c9e4398a8c01abb99e216089c39590f8b4"
    end
  end

  on_linux do
    url "https://github.com/bryancostanich/Cercano/releases/download/v#{version}/cercano-linux-amd64"
    sha256 "aadeabfb6ed586bfdcf3783f0badbf06820374dbb85120cb84f6f20e15a1e74f"
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
