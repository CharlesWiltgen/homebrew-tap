class Tuneup < Formula
  desc "Command-line music utility showcasing taglib-wasm capabilities"
  homepage "https://github.com/CharlesWiltgen/tuneup"
  version "0.9.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/CharlesWiltgen/tuneup-releases/releases/download/v0.9.0/tuneup-macos-arm64.tar.gz"
      sha256 "805111ca39276c2b09aba3be65a0b56272bb2ea6d68f75afcec9037d09817cc1"
    else
      url "https://github.com/CharlesWiltgen/tuneup-releases/releases/download/v0.9.0/tuneup-macos-x86_64.tar.gz"
      sha256 "87915ded1577d098623c16bfe601ee94bac72f906ac381ef6a188666480609dd"
    end
  end

  on_linux do
    url "https://github.com/CharlesWiltgen/tuneup-releases/releases/download/v0.9.0/tuneup-linux-x86_64.tar.gz"
    sha256 "270770760842e4b9a1b0fdf678ecee5af631ad595afef82504392c9d9e705b9a"
  end

  def install
    if OS.mac?
      bin.install Hardware::CPU.arm? ? "tuneup-macos-arm64" : "tuneup-macos-x86_64" => "tuneup"
    else
      bin.install "tuneup-linux-x86_64" => "tuneup"
    end
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/tuneup --version")
  end
end