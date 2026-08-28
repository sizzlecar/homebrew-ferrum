class Ferrum < Formula
  desc "Production-grade LLM inference in Rust for Apple Silicon and Linux CPU"
  homepage "https://github.com/sizzlecar/ferrum-infer-rs"
  version "0.8.3"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/sizzlecar/ferrum-infer-rs/releases/download/v0.8.3/ferrum-macos-aarch64.tar.gz"
      sha256 "bce982ac957f4fbc1a24483a198967a870608b9c20b8f776868969c1b2fe5a2b"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/sizzlecar/ferrum-infer-rs/releases/download/v0.8.3/ferrum-linux-x86_64.tar.gz"
      sha256 "57f05175cc9817b166fcf14cdf6fde66509d2de24a4895259bfcf77589c54d30"
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
