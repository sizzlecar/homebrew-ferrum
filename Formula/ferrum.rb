class Ferrum < Formula
  desc "Production-grade LLM inference in Rust for Apple Silicon and Linux CPU"
  homepage "https://github.com/sizzlecar/ferrum-infer-rs"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/sizzlecar/ferrum-infer-rs/releases/download/v0.18.5/ferrum-macos-aarch64.tar.gz"
      sha256 "70ed58801427e44ee654724c7ac2b1ac2ebfa80310d304fe30755b05de9f80f1"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/sizzlecar/ferrum-infer-rs/releases/download/v0.18.5/ferrum-linux-x86_64.tar.gz"
      sha256 "0d6c6286c35ca80c4db4f96b9ab8125f92d4dfd3df35dc94a6eebb56085fcb65"
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
