class Ferrum < Formula
  desc "Production-grade LLM inference in Rust for Apple Silicon and Linux CPU"
  homepage "https://github.com/sizzlecar/ferrum-infer-rs"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/sizzlecar/ferrum-infer-rs/releases/download/v0.8.7/ferrum-macos-aarch64.tar.gz"
      sha256 "cbff769d99d3fb1e8aa05a07c0e46870c03f88d5e808d23d445633cad9211ba2"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/sizzlecar/ferrum-infer-rs/releases/download/v0.8.7/ferrum-linux-x86_64.tar.gz"
      sha256 "3407347779e5dca8bbcfbe308f2820cea786b532f3954f564edf18e4b90d5fa1"
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
