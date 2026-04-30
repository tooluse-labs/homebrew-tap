class PerfettoMcpRs < Formula
  desc "MCP server for Perfetto trace analysis"
  homepage "https://github.com/0xZOne/perfetto-mcp-rs"
  version "0.12.2"
  license any_of: ["MIT", "Apache-2.0"]

  on_macos do
    on_arm do
      url "https://github.com/0xZOne/perfetto-mcp-rs/releases/download/v#{version}/perfetto-mcp-rs-darwin-arm64"
      sha256 "7de1eb3c01e1f9cabef0418705d918f572301bc39709ff77e245d8228271c5c8"
    end
    on_intel do
      url "https://github.com/0xZOne/perfetto-mcp-rs/releases/download/v#{version}/perfetto-mcp-rs-darwin-amd64"
      sha256 "0567a84f9f6e138ff30bc54be5d549fdfa20d6a68b1534fb705996b4cf745abf"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/0xZOne/perfetto-mcp-rs/releases/download/v#{version}/perfetto-mcp-rs-linux-arm64"
      sha256 "7265b198d3a786d9ce77f8a92ddd344e8dd39683bd31cda3b6673a45c83164fb"
    end
    on_intel do
      url "https://github.com/0xZOne/perfetto-mcp-rs/releases/download/v#{version}/perfetto-mcp-rs-linux-amd64"
      sha256 "b2f00e379972d3ecb726235af824c4bbe02474b686f27570ae7d4a6ac4882e38"
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
