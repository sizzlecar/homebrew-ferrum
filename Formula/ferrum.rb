class Ferrum < Formula
  desc "Production-grade LLM inference in Rust for Apple Silicon and Linux CPU"
  homepage "https://github.com/sizzlecar/ferrum-infer-rs"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/sizzlecar/ferrum-infer-rs/releases/download/v0.19.1/ferrum-macos-aarch64.tar.gz"
      sha256 "95b2025f53fc5c217dafea23e520b43e1a6f2d83f86f972f30133f84097a3a5b"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/sizzlecar/ferrum-infer-rs/releases/download/v0.19.1/ferrum-linux-x86_64.tar.gz"
      sha256 "148eb7e4a595a59a8f145ae1cb72c87282547631a796a71bb3476bd4bbb078d8"
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
