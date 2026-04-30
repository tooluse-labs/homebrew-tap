# homebrew-tap

Homebrew tap for [perfetto-mcp-rs](https://github.com/tooluse-labs/perfetto-mcp-rs) — an
MCP server for Perfetto trace analysis.

## Install

```sh
brew tap tooluse-labs/tap
brew install perfetto-mcp-rs
```

After install, run the printed caveat to register with Claude Code / Codex:

```sh
perfetto-mcp-rs install --binary-path "$(brew --prefix)/bin/perfetto-mcp-rs"
```

## Updates

The formula at `Formula/perfetto-mcp-rs.rb` is auto-bumped on each release of the
upstream repo. To upgrade locally:

```sh
brew update
brew upgrade perfetto-mcp-rs
```
