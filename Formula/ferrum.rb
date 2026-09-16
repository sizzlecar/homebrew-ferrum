class Ferrum < Formula
  desc "Production-grade LLM inference in Rust for Apple Silicon and Linux CPU"
  homepage "https://github.com/sizzlecar/ferrum-infer-rs"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/sizzlecar/ferrum-infer-rs/releases/download/v0.10.0/ferrum-macos-aarch64.tar.gz"
      sha256 "aeb07e397992decf3fe8ef8b99aa2248e5e77b492cfb0d52261070547a73c13e"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/sizzlecar/ferrum-infer-rs/releases/download/v0.10.0/ferrum-linux-x86_64.tar.gz"
      sha256 "26b60549ce5ccb59540b683a1b4d16c0d48ff370216c8f0a6d3352959a88d2ab"
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
