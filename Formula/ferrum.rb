class Ferrum < Formula
  desc "Production-grade LLM inference in Rust for Apple Silicon and Linux CPU"
  homepage "https://github.com/sizzlecar/ferrum-infer-rs"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/sizzlecar/ferrum-infer-rs/releases/download/v0.19.0/ferrum-macos-aarch64.tar.gz"
      sha256 "6cac0970e528d2b42e59adf43371e8d1404eb282d5d29150ab68452acb54d1d9"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/sizzlecar/ferrum-infer-rs/releases/download/v0.19.0/ferrum-linux-x86_64.tar.gz"
      sha256 "ee946954cdae95b9a1201c53aa2d1b39389ece6b86a4aae1840bd729d9edaae5"
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
