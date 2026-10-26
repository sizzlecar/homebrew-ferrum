class Ferrum < Formula
  desc "Production-grade LLM inference in Rust for Apple Silicon and Linux CPU"
  homepage "https://github.com/sizzlecar/ferrum-infer-rs"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/sizzlecar/ferrum-infer-rs/releases/download/v0.16.0/ferrum-macos-aarch64.tar.gz"
      sha256 "0b9bf98f7e64fa4ed818568b020edbc99fefe9f91b704b174047fc59698b8614"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/sizzlecar/ferrum-infer-rs/releases/download/v0.16.0/ferrum-linux-x86_64.tar.gz"
      sha256 "9b043241ce37a9b685a5b795ea3350928f85ae4c5dfa80b3bc4bd00fa25bbeba"
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
