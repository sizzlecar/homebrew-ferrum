class Ferrum < Formula
  desc "Production-grade LLM inference in Rust for Apple Silicon and Linux CPU"
  homepage "https://github.com/sizzlecar/ferrum-infer-rs"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/sizzlecar/ferrum-infer-rs/releases/download/v0.12.1/ferrum-macos-aarch64.tar.gz"
      sha256 "26da4fb1d32e893fd668cbf5a1f5c9f1abd5b4cd139830f33185a606b1422c57"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/sizzlecar/ferrum-infer-rs/releases/download/v0.12.1/ferrum-linux-x86_64.tar.gz"
      sha256 "b19b9e7c41373192880745dc405dfde9ebc834d7093411c1c2a3297e654b7ae4"
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
