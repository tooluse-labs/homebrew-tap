class PerfettoMcpRs < Formula
  desc "MCP server for Perfetto trace analysis"
  homepage "https://github.com/0xZOne/perfetto-mcp-rs"
  version "0.12.3"
  license any_of: ["MIT", "Apache-2.0"]

  on_macos do
    on_arm do
      url "https://github.com/0xZOne/perfetto-mcp-rs/releases/download/v#{version}/perfetto-mcp-rs-darwin-arm64"
      sha256 "f71ff6afbde0f14f232b0ab44b74e81fd8061da86735bb9c62cbd476514faa51"
    end
    on_intel do
      url "https://github.com/0xZOne/perfetto-mcp-rs/releases/download/v#{version}/perfetto-mcp-rs-darwin-amd64"
      sha256 "a06842a68cb0b26186d003534c35cc4eb2d38115bfb21ec034ea34dbcc494e3a"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/0xZOne/perfetto-mcp-rs/releases/download/v#{version}/perfetto-mcp-rs-linux-arm64"
      sha256 "1c82d53c26989503a3aed9653178736aec6e5224cad83061b2bb371c762f9829"
    end
    on_intel do
      url "https://github.com/0xZOne/perfetto-mcp-rs/releases/download/v#{version}/perfetto-mcp-rs-linux-amd64"
      sha256 "b0afe88c0d8c7edea9cb46d1594bb0c2416ddb844b25d68591c67e8e302d0a4a"
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
