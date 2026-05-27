class PerfettoMcpRs < Formula
  desc "MCP server for Perfetto trace analysis"
  homepage "https://github.com/tooluse-labs/perfetto-mcp-rs"
  version "0.15.11"
  license any_of: ["MIT", "Apache-2.0"]

  on_macos do
    on_arm do
      url "https://github.com/tooluse-labs/perfetto-mcp-rs/releases/download/v#{version}/perfetto-mcp-rs-darwin-arm64"
      sha256 "bbfeb4dcc47a2c2b97b8907f8eb724ad2aec3560bc68422b758a108a3ab14a20"
    end
    on_intel do
      url "https://github.com/tooluse-labs/perfetto-mcp-rs/releases/download/v#{version}/perfetto-mcp-rs-darwin-amd64"
      sha256 "6680207382f17d9ee7b38222c2ae6081bca9940fd5d0d01809c94e13002ebbb9"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/tooluse-labs/perfetto-mcp-rs/releases/download/v#{version}/perfetto-mcp-rs-linux-arm64"
      sha256 "82a286a9976b78e6807b350c8c504f89c36e44975f2b08dba56a36e79a6e58d1"
    end
    on_intel do
      url "https://github.com/tooluse-labs/perfetto-mcp-rs/releases/download/v#{version}/perfetto-mcp-rs-linux-amd64"
      sha256 "7f449a81f67d83c80198a3aaba4dbf2f10637ee9f8a14378174a85558979f3fb"
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
