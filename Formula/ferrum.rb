class Ferrum < Formula
  desc "Production-grade LLM inference in Rust for Apple Silicon and Linux CPU"
  homepage "https://github.com/sizzlecar/ferrum-infer-rs"
  version "0.7.5"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/sizzlecar/ferrum-infer-rs/releases/download/v0.7.5/ferrum-macos-aarch64.tar.gz"
      sha256 "0401a1109625c2d895ae1e3d83290fa7bed5b6ebc7b598889234dfe703b34f53"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/sizzlecar/ferrum-infer-rs/releases/download/v0.7.5/ferrum-linux-x86_64.tar.gz"
      sha256 "1343f81e6876cde06250944b5ef919377d7fa9ec7d36d08a7eaf24b9b7207da0"
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
