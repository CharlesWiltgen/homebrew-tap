class Tuneup < Formula
  desc "Command-line music utility showcasing taglib-wasm capabilities"
  homepage "https://github.com/CharlesWiltgen/tuneup"
  version "0.9.2-rc.1"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/CharlesWiltgen/tuneup-releases/releases/download/v0.9.2-rc.1/tuneup-macos-arm64.tar.gz"
      sha256 "6f86728ec792d2063ab3ca0999cdb766b5378f8ad63cadc065ad7c9a41de3cf7"
    else
      url "https://github.com/CharlesWiltgen/tuneup-releases/releases/download/v0.9.2-rc.1/tuneup-macos-x86_64.tar.gz"
      sha256 "9133b1025e27f6fa4f0f183468b1fb5b9f8e5f0a6ebb44b90aeb09f18e77abd1"
    end
  end

  on_linux do
    url "https://github.com/CharlesWiltgen/tuneup-releases/releases/download/v0.9.2-rc.1/tuneup-linux-x86_64.tar.gz"
    sha256 "2bc74bfdb8463a2eed86747fd1ad13c4d9d00deb806a2c294db02f16460ba48e"
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