# homebrew-ferrum

Homebrew tap for Ferrum **0.13.0**, a Rust LLM runtime and OpenAI-compatible server.

[Website](https://ferrum.pandaailabs.com/) · [Documentation / 中文](https://github.com/sizzlecar/ferrum-infer-rs#readme) · [Release notes](https://github.com/sizzlecar/ferrum-infer-rs/releases/tag/v0.13.0)

## Install

Apple Silicon / Linux CPU:

```bash
brew tap sizzlecar/ferrum
brew install ferrum
ferrum --version
ferrum serve --help
```

Linux x86_64 CUDA sm89:

```bash
brew tap sizzlecar/ferrum
brew install ferrum-cuda
ferrum --version
ferrum serve --help
```

## Packages

- `ferrum`: macOS Apple Silicon Metal binary, or Linux x86_64 CPU binary.
- `ferrum-cuda`: Linux x86_64 SM89 binary, built with CUDA 12.4. Requires a compatible NVIDIA driver, CUDA 12 runtime libraries and NCCL.

For Linux/WSL SM120, use the [website installer](https://ferrum.pandaailabs.com/#quick-start).

`ferrum` and `ferrum-cuda` conflict because both install the `ferrum` executable.

## Upgrade

```bash
brew update
brew upgrade sizzlecar/ferrum/ferrum
```

Use `sizzlecar/ferrum/ferrum-cuda` instead if you installed the CUDA package.
