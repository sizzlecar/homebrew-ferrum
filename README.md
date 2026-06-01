# homebrew-ferrum

Homebrew tap for [ferrum-infer-rs](https://github.com/sizzlecar/ferrum-infer-rs).

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
- `ferrum-cuda`: Linux x86_64 CUDA sm89 binary for NVIDIA hosts with driver and CUDA 12 runtime libraries installed.

`ferrum` and `ferrum-cuda` conflict because both install the `ferrum` executable.
