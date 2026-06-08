class PerfettoMcpRs < Formula
  desc "MCP server for Perfetto trace analysis"
  homepage "https://github.com/tooluse-labs/perfetto-mcp-rs"
  version "0.16.0"
  license any_of: ["MIT", "Apache-2.0"]

  on_macos do
    on_arm do
      url "https://github.com/tooluse-labs/perfetto-mcp-rs/releases/download/v#{version}/perfetto-mcp-rs-darwin-arm64"
      sha256 "99834f7120ccbcd6223f1651e18895425df3e90a7970c1ec7689e76e401b2925"
    end
    on_intel do
      url "https://github.com/tooluse-labs/perfetto-mcp-rs/releases/download/v#{version}/perfetto-mcp-rs-darwin-amd64"
      sha256 "1119b69189e2a85eb4c518487896586a0a00ae26a6ba6c26a11608079f8db75e"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/tooluse-labs/perfetto-mcp-rs/releases/download/v#{version}/perfetto-mcp-rs-linux-arm64"
      sha256 "3ea5b417012b8eb8803f4c96a0061e741f91f576966e3a06c47d6bf877a2b0a3"
    end
    on_intel do
      url "https://github.com/tooluse-labs/perfetto-mcp-rs/releases/download/v#{version}/perfetto-mcp-rs-linux-amd64"
      sha256 "2246e835e18c7aa9db917069911dffa500f569dcf160bf1d6f4df1b3cb3c0b69"
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
