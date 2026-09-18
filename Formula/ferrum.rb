class Ferrum < Formula
  desc "Production-grade LLM inference in Rust for Apple Silicon and Linux CPU"
  homepage "https://github.com/sizzlecar/ferrum-infer-rs"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/sizzlecar/ferrum-infer-rs/releases/download/v0.11.0/ferrum-macos-aarch64.tar.gz"
      sha256 "45e657785399f7e41eea3f4818e9bd36faf12940dc43524dff85c753e95e550b"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/sizzlecar/ferrum-infer-rs/releases/download/v0.11.0/ferrum-linux-x86_64.tar.gz"
      sha256 "bb2e52f891acd00bec46e038f7ef28a9b8b5e825d1a8ad58d806900ceac19ee4"
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
