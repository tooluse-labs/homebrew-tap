class PerfettoMcpRs < Formula
  desc "MCP server for Perfetto trace analysis"
  homepage "https://github.com/0xZOne/perfetto-mcp-rs"
  version "0.12.1"
  license any_of: ["MIT", "Apache-2.0"]

  on_macos do
    on_arm do
      url "https://github.com/0xZOne/perfetto-mcp-rs/releases/download/v#{version}/perfetto-mcp-rs-darwin-arm64"
      sha256 "67efba2591f99cc7ee42e6fd5530ff9419a441cb6803f03de30be0bdd4580a27"
    end
    on_intel do
      url "https://github.com/0xZOne/perfetto-mcp-rs/releases/download/v#{version}/perfetto-mcp-rs-darwin-amd64"
      sha256 "520d878eaa02dca905eeb90d11bdb96aa796ee821fb85b761231bb144e61324a"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/0xZOne/perfetto-mcp-rs/releases/download/v#{version}/perfetto-mcp-rs-linux-arm64"
      sha256 "d543c14f54f464b385ae9bc2a3f7d1de673731a7c89cbeff4d185925f7243ad7"
    end
    on_intel do
      url "https://github.com/0xZOne/perfetto-mcp-rs/releases/download/v#{version}/perfetto-mcp-rs-linux-amd64"
      sha256 "0c65162d86342a45b4e676ef7917f1629ef54ebdd76fcacf499e254fa83c14fb"
    end
  end

  def install
    bin.install Dir["perfetto-mcp-rs-*"].first => "perfetto-mcp-rs"
  end

  def caveats
    <<~EOS
      To register with Claude Code / Codex, run:
        perfetto-mcp-rs install --binary-path "$(brew --prefix)/bin/perfetto-mcp-rs"

      To uninstall (run in this order):
        perfetto-mcp-rs uninstall
        brew uninstall perfetto-mcp-rs
    EOS
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/perfetto-mcp-rs --version")
  end
end
