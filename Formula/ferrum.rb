class Ferrum < Formula
  desc "Production-grade LLM inference in Rust for Apple Silicon and Linux CPU"
  homepage "https://github.com/sizzlecar/ferrum-infer-rs"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/sizzlecar/ferrum-infer-rs/releases/download/v0.8.9/ferrum-macos-aarch64.tar.gz"
      sha256 "ace3a80e568082a8e10241be05b05752d76e0dc3a88096346a4ce26ff577e9ef"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/sizzlecar/ferrum-infer-rs/releases/download/v0.8.9/ferrum-linux-x86_64.tar.gz"
      sha256 "7ac95cbbba62f35d424f8b48ea60915813fd47890347ea1d54f46a73007f7e7e"
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
