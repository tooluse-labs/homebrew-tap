class PerfettoMcpRs < Formula
  desc "MCP server for Perfetto trace analysis"
  homepage "https://github.com/tooluse-labs/perfetto-mcp-rs"
  version "0.15.12"
  license any_of: ["MIT", "Apache-2.0"]

  on_macos do
    on_arm do
      url "https://github.com/tooluse-labs/perfetto-mcp-rs/releases/download/v#{version}/perfetto-mcp-rs-darwin-arm64"
      sha256 "0b1e7c74f12374d821ed95b1ab9f22bb9af7d0b9a0750dc30d1f8523b73556ed"
    end
    on_intel do
      url "https://github.com/tooluse-labs/perfetto-mcp-rs/releases/download/v#{version}/perfetto-mcp-rs-darwin-amd64"
      sha256 "014c44def0c5bdddb6448a856c4b8b7b9909e6edd3455cf16070b0dc7463f905"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/tooluse-labs/perfetto-mcp-rs/releases/download/v#{version}/perfetto-mcp-rs-linux-arm64"
      sha256 "457c48264eead40a577e8daae9a2d466757d3f11120e8c664e651543966e888f"
    end
    on_intel do
      url "https://github.com/tooluse-labs/perfetto-mcp-rs/releases/download/v#{version}/perfetto-mcp-rs-linux-amd64"
      sha256 "1bcaa8ffca3c5d17dc1dd220b2661a56381a80bf3fdecfcd8a5459c5bc210cb7"
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
