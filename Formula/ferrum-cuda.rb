class FerrumCuda < Formula
  desc "Production-grade LLM inference in Rust with NVIDIA CUDA sm89 support"
  homepage "https://github.com/sizzlecar/ferrum-infer-rs"
  url "https://github.com/sizzlecar/ferrum-infer-rs/releases/download/v0.7.7/ferrum-linux-x86_64-cuda-sm89.tar.gz"
  version "0.7.7"
  sha256 "6397de942d1c767383982186642da3990df49ea1cd6f604434a6cc9d6f7f912b"
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
      and libcuda on the target host.
    EOS
  end

  test do
    assert_path_exists bin/"ferrum"
  end
end
