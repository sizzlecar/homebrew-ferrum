class Ferrum < Formula
  desc "Production-grade LLM inference in Rust for Apple Silicon and Linux CPU"
  homepage "https://github.com/sizzlecar/ferrum-infer-rs"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/sizzlecar/ferrum-infer-rs/releases/download/v0.8.8/ferrum-macos-aarch64.tar.gz"
      sha256 "e0e4024eece92930676d78739c584883c3f2eb36ff34cf8ed93ed80822c0e7d9"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/sizzlecar/ferrum-infer-rs/releases/download/v0.8.8/ferrum-linux-x86_64.tar.gz"
      sha256 "8c8be311d6b3b4f4fc3578725fc752a6338713e844c773b16d4b12dc200b0c11"
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
