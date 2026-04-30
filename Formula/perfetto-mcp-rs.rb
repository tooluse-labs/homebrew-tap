class PerfettoMcpRs < Formula
  desc "MCP server for Perfetto trace analysis"
  homepage "https://github.com/0xZOne/perfetto-mcp-rs"
  version "0.12.0"
  license any_of: ["MIT", "Apache-2.0"]

  on_macos do
    on_arm do
      url "https://github.com/0xZOne/perfetto-mcp-rs/releases/download/v#{version}/perfetto-mcp-rs-darwin-arm64"
      sha256 "c6d3e444c32b29c75a7aa395a43bbd3b0ce07fa86bafecb7eb17b3cbc3a11869"
    end
    on_intel do
      url "https://github.com/0xZOne/perfetto-mcp-rs/releases/download/v#{version}/perfetto-mcp-rs-darwin-amd64"
      sha256 "530e3a42f540ef470c836c0e86a9245cef49ac13d68397aab8cb07ce80e1bb02"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/0xZOne/perfetto-mcp-rs/releases/download/v#{version}/perfetto-mcp-rs-linux-arm64"
      sha256 "d7fc1b798670c3c104bd7488671e95acff3cb528301ca46df6f204063a58f778"
    end
    on_intel do
      url "https://github.com/0xZOne/perfetto-mcp-rs/releases/download/v#{version}/perfetto-mcp-rs-linux-amd64"
      sha256 "caafd3ed1821709f78dae9868f51a061181a9e7724943e7888027f5df200a03a"
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
