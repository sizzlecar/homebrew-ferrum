class Ferrum < Formula
  desc "Production-grade LLM inference in Rust — runs on Apple Silicon and CUDA"
  homepage "https://github.com/sizzlecar/ferrum-infer-rs"
  version "0.7.3"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/sizzlecar/ferrum-infer-rs/releases/download/v0.7.3/ferrum-macos-aarch64.tar.gz"
      sha256 "1865a978dee2ada448984253242d8475d592375085fdaae65fe3b5f6856047f0"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/sizzlecar/ferrum-infer-rs/releases/download/v0.7.3/ferrum-linux-x86_64.tar.gz"
      sha256 "61abddfc7403b5c1964c5c18a2f9e11d530f7b3f8546c4c45fb8a8c697928a0f"
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
