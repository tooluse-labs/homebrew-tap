class PerfettoMcpRs < Formula
  desc "MCP server for Perfetto trace analysis"
  homepage "https://github.com/tooluse-labs/perfetto-mcp-rs"
  version "0.14.0"
  license any_of: ["MIT", "Apache-2.0"]

  on_macos do
    on_arm do
      url "https://github.com/tooluse-labs/perfetto-mcp-rs/releases/download/v#{version}/perfetto-mcp-rs-darwin-arm64"
      sha256 "640c69098836b79ef417645a5b27ddaaecaf6ecb7429543dacbbb404f3cb5111"
    end
    on_intel do
      url "https://github.com/tooluse-labs/perfetto-mcp-rs/releases/download/v#{version}/perfetto-mcp-rs-darwin-amd64"
      sha256 "d1cfc45ecc2c922e63a7d2e6e8a7232d6dedb7ca78fdf129f6a76f167b3e8810"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/tooluse-labs/perfetto-mcp-rs/releases/download/v#{version}/perfetto-mcp-rs-linux-arm64"
      sha256 "6e7970708cd76b8f5c977c3867f55c832044e9445641fb8776804dbd07257740"
    end
    on_intel do
      url "https://github.com/tooluse-labs/perfetto-mcp-rs/releases/download/v#{version}/perfetto-mcp-rs-linux-amd64"
      sha256 "60930e339ede9e43cfc5fb66992a026387f77eb76d94ae7c2b4b2a26d79d0042"
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
