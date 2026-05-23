class PerfettoMcpRs < Formula
  desc "MCP server for Perfetto trace analysis"
  homepage "https://github.com/tooluse-labs/perfetto-mcp-rs"
  version "0.15.5"
  license any_of: ["MIT", "Apache-2.0"]

  on_macos do
    on_arm do
      url "https://github.com/tooluse-labs/perfetto-mcp-rs/releases/download/v#{version}/perfetto-mcp-rs-darwin-arm64"
      sha256 "162417b575d665743fc98ea1e765da9ab244638e9acc0a415bb8343a677c4f21"
    end
    on_intel do
      url "https://github.com/tooluse-labs/perfetto-mcp-rs/releases/download/v#{version}/perfetto-mcp-rs-darwin-amd64"
      sha256 "bc5ca13fd917d8baa3e32b854cd65eee77db913a8b308ed43e1da1b3c16d90c2"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/tooluse-labs/perfetto-mcp-rs/releases/download/v#{version}/perfetto-mcp-rs-linux-arm64"
      sha256 "6ec2a67e3271572c20cf6933d55207c485f0590d8690d9c332412639bb934136"
    end
    on_intel do
      url "https://github.com/tooluse-labs/perfetto-mcp-rs/releases/download/v#{version}/perfetto-mcp-rs-linux-amd64"
      sha256 "984738a2d7da64bfba8757cdb53d4a5b611d864b432b70a18d398704158eb5d1"
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
