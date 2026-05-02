# homebrew-ferrum

Homebrew tap for [ferrum-infer-rs](https://github.com/sizzlecar/ferrum-infer-rs).

## Install

```bash
brew tap sizzlecar/ferrum
brew install ferrum
ferrum --version
```

Supported platforms:
- macOS Apple Silicon (Metal acceleration)
- Linux x86_64 (CPU)

For CUDA, build from source: `cargo install ferrum-cli --features cuda`.
