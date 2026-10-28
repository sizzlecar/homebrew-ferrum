class Ferrum < Formula
  desc "Production-grade LLM inference in Rust for Apple Silicon and Linux CPU"
  homepage "https://github.com/sizzlecar/ferrum-infer-rs"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/sizzlecar/ferrum-infer-rs/releases/download/v0.17.0/ferrum-macos-aarch64.tar.gz"
      sha256 "b221cdccd90b4165abe16d4a427728b6353c111ee4d0bf03900b79eaebd51967"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/sizzlecar/ferrum-infer-rs/releases/download/v0.17.0/ferrum-linux-x86_64.tar.gz"
      sha256 "52ab351685d4e395e1a230b2a0d92ec31ac210d3fe2099c2bf3ffd558c429dcd"
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
