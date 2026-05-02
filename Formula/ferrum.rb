class Ferrum < Formula
  desc "Production-grade LLM inference in Rust — runs on Apple Silicon and CUDA"
  homepage "https://github.com/sizzlecar/ferrum-infer-rs"
  version "0.7.2"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/sizzlecar/ferrum-infer-rs/releases/download/v0.7.2/ferrum-macos-aarch64.tar.gz"
      sha256 "f6173d95d5c495c8bd8eea40e26a70af073ddb5c380ad6a91d4d8375b3f3bf50"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/sizzlecar/ferrum-infer-rs/releases/download/v0.7.2/ferrum-linux-x86_64.tar.gz"
      sha256 "1ebfb3af21a670b37539ff9c64a718cc00519b9de9e4892c69bc2b330047ec14"
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
