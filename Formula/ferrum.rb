class Ferrum < Formula
  desc "Production-grade LLM inference in Rust for Apple Silicon and Linux CPU"
  homepage "https://github.com/sizzlecar/ferrum-infer-rs"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/sizzlecar/ferrum-infer-rs/releases/download/v0.12.0/ferrum-macos-aarch64.tar.gz"
      sha256 "28f5f262088e9b0309fe5db24a4cfb0dd2d392f7c5e2e84a01be315c6521ee54"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/sizzlecar/ferrum-infer-rs/releases/download/v0.12.0/ferrum-linux-x86_64.tar.gz"
      sha256 "6e86f00bc45ce1a21c2cd4f5c3e4020daaf59fb638ced1d521db9ec1dc62f565"
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
