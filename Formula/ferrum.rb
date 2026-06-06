class Ferrum < Formula
  desc "Production-grade LLM inference in Rust for Apple Silicon and Linux CPU"
  homepage "https://github.com/sizzlecar/ferrum-infer-rs"
  version "0.7.6"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/sizzlecar/ferrum-infer-rs/releases/download/v0.7.6/ferrum-macos-aarch64.tar.gz"
      sha256 "c405f93b0c2d41967f9f8b7e8efbb7ac02beead81296d9c343ab9c3db6356a99"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/sizzlecar/ferrum-infer-rs/releases/download/v0.7.6/ferrum-linux-x86_64.tar.gz"
      sha256 "5bb65061cbd3a9822bc06240ad99f9e7e04e5216989f8204331a1a9ac5c4778b"
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
