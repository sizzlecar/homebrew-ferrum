class Ferrum < Formula
  desc "Production-grade LLM inference in Rust for Apple Silicon and Linux CPU"
  homepage "https://github.com/sizzlecar/ferrum-infer-rs"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/sizzlecar/ferrum-infer-rs/releases/download/v0.18.2/ferrum-macos-aarch64.tar.gz"
      sha256 "a65670260943a19b3d7f9f9dd7851575bfa737f189dba95f6120ec2dd67a6b76"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/sizzlecar/ferrum-infer-rs/releases/download/v0.18.2/ferrum-linux-x86_64.tar.gz"
      sha256 "cc49370dd64b0a9d0a0d6582eedd2deac67de4b4d6f7c14ad394c4e3b206d54c"
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
