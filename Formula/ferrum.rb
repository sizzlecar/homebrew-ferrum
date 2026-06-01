class Ferrum < Formula
  desc "Production-grade LLM inference in Rust for Apple Silicon and Linux CPU"
  homepage "https://github.com/sizzlecar/ferrum-infer-rs"
  version "0.7.4"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/sizzlecar/ferrum-infer-rs/releases/download/v0.7.4/ferrum-macos-aarch64.tar.gz"
      sha256 "3be3d31d668d92ab8d9691b4376465fd81329ad1d3c1357a621393194977e8ac"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/sizzlecar/ferrum-infer-rs/releases/download/v0.7.4/ferrum-linux-x86_64.tar.gz"
      sha256 "94e09a38a0b130e9bd529bfa69abdb627dc6dcc49012279c14250581e4b5198d"
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
