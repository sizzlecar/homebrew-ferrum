class FerrumCuda < Formula
  desc "Production-grade LLM inference in Rust with NVIDIA CUDA sm89 support"
  homepage "https://github.com/sizzlecar/ferrum-infer-rs"
  url "https://github.com/sizzlecar/ferrum-infer-rs/releases/download/v0.14.0/ferrum-linux-x86_64-cuda-sm89.tar.gz"
  sha256 "798c42c9bd3bf34dfb4259b2ceb76e9c6909d50d964415d7bc64bd39dd2330d9"
  license "MIT"

  depends_on :linux

  conflicts_with "ferrum", because: "both install the ferrum binary"

  def install
    bin.install "ferrum"
    doc.install "README.md"
    doc.install "CUDA-BUILD.txt"
  end

  def caveats
    <<~EOS
      ferrum-cuda is the Linux x86_64 CUDA sm89 build. It requires an NVIDIA
      driver plus CUDA 12 runtime libraries such as libcudart, cublas, curand,
      and libcuda, plus the NCCL runtime on the target host.
    EOS
  end

  test do
    assert_path_exists bin/"ferrum"
  end
end
