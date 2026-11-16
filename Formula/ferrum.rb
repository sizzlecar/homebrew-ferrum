class Ferrum < Formula
  desc "Production-grade LLM inference in Rust for Apple Silicon and Linux CPU"
  homepage "https://github.com/sizzlecar/ferrum-infer-rs"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/sizzlecar/ferrum-infer-rs/releases/download/v0.20.0/ferrum-macos-aarch64.tar.gz"
      sha256 "8c35a278bf8a97bacf80284e38b74f6afb34e8e9b517f7f64fb39c911178c0da"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/sizzlecar/ferrum-infer-rs/releases/download/v0.20.0/ferrum-linux-x86_64.tar.gz"
      sha256 "0f1d14092585489aee21e0c28a38d991f00aec77d4dac4e216ba7ca3c43896eb"
    end
  end

  conflicts_with "ferrum-cuda", because: "both install the ferrum binary"

  def install
    bin.install "ferrum"
    doc.install "README.md"
  end

  test do
    assert_match "ferrum #{version}", shell_output("#{bin}/ferrum --version")
    assert_match "serve", shell_output("#{bin}/ferrum serve --help")
  end
end
