class Ferrum < Formula
  desc "Production-grade LLM inference in Rust for Apple Silicon and Linux CPU"
  homepage "https://github.com/sizzlecar/ferrum-infer-rs"
  version "0.7.7"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/sizzlecar/ferrum-infer-rs/releases/download/v0.7.7/ferrum-macos-aarch64.tar.gz"
      sha256 "e685342eb9d3050c1d4117ef71ecd20418f91bd731c8f304269b4ec36936247b"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/sizzlecar/ferrum-infer-rs/releases/download/v0.7.7/ferrum-linux-x86_64.tar.gz"
      sha256 "b98e22701a3a5b6d79ce4489ba1fcc1201a2925f24b9c87e35bc1678fb459715"
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
