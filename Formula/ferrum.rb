class Ferrum < Formula
  desc "Production-grade LLM inference in Rust — runs on Apple Silicon and CUDA"
  homepage "https://github.com/sizzlecar/ferrum-infer-rs"
  version "0.7.1"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/sizzlecar/ferrum-infer-rs/releases/download/v0.7.1/ferrum-macos-aarch64.tar.gz"
      sha256 "7d203e759d6cabc286e316978a4381c103f071cd3f08953f387fe070d8229b96"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/sizzlecar/ferrum-infer-rs/releases/download/v0.7.1/ferrum-linux-x86_64.tar.gz"
      sha256 "c5b8c3c3a5512db0f338e7ca646986f17649903925d7f6ec3b3781b36e677603"
    end
  end

  def install
    bin.install "ferrum"
    doc.install "README.md"
  end

  test do
    assert_match "ferrum #{version}", shell_output("#{bin}/ferrum --version")
  end
end
