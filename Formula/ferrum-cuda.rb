class FerrumCuda < Formula
  desc "Production-grade LLM inference in Rust with NVIDIA CUDA sm89 support"
  homepage "https://github.com/sizzlecar/ferrum-infer-rs"
  url "https://github.com/sizzlecar/ferrum-infer-rs/releases/download/v0.19.0/ferrum-linux-x86_64-cuda-sm89.tar.gz"
  sha256 "8e3e4887a1f04de6f1d365d17e2cdb45ce8e4438dad00751e35ebb2f086f39e7"
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
