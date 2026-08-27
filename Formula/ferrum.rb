class Ferrum < Formula
  desc "Production-grade LLM inference in Rust for Apple Silicon and Linux CPU"
  homepage "https://github.com/sizzlecar/ferrum-infer-rs"
  version "0.8.1"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/sizzlecar/ferrum-infer-rs/releases/download/v0.8.1/ferrum-macos-aarch64.tar.gz"
      sha256 "386ebdf6b7b4d3c138452d74c8b85fd08a2c064d3080c1f99b6ef239e66b2a48"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/sizzlecar/ferrum-infer-rs/releases/download/v0.8.1/ferrum-linux-x86_64.tar.gz"
      sha256 "8e35c5798302086ccecde7d049a5563dfd7639da948d4fb0fbf645a53ac0d1cd"
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
