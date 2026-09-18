class FerrumCuda < Formula
  desc "Production-grade LLM inference in Rust with NVIDIA CUDA sm89 support"
  homepage "https://github.com/sizzlecar/ferrum-infer-rs"
  url "https://github.com/sizzlecar/ferrum-infer-rs/releases/download/v0.11.0/ferrum-linux-x86_64-cuda-sm89.tar.gz"
  sha256 "df0b4bba6ab1217393f9ba3ba6991a4ce477aa41e74f3a3719545a916876891f"
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
