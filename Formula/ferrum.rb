class Ferrum < Formula
  desc "Production-grade LLM inference in Rust for Apple Silicon and Linux CPU"
  homepage "https://github.com/sizzlecar/ferrum-infer-rs"
  version "0.8.2"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/sizzlecar/ferrum-infer-rs/releases/download/v0.8.2/ferrum-macos-aarch64.tar.gz"
      sha256 "4d05bbdc3ed2f8a2d8226567e859ebdcd5afe3b36b9af12db706305d3767f8e0"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/sizzlecar/ferrum-infer-rs/releases/download/v0.8.2/ferrum-linux-x86_64.tar.gz"
      sha256 "07dc64710dc48b3ffba536de6e97878cc8b619833473ecffbd2d2905f3f34d61"
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
