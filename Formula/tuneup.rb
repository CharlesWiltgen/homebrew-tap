class Tuneup < Formula
  desc "Command-line music utility showcasing taglib-wasm capabilities"
  homepage "https://github.com/CharlesWiltgen/tuneup"
  version "0.9.1-rc.1"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/CharlesWiltgen/tuneup-releases/releases/download/v0.9.1-rc.1/tuneup-macos-arm64.tar.gz"
      sha256 "d898a5a917934e48e85f80137f35acec61b7da90012550d7df76ef98947703b3"
    else
      url "https://github.com/CharlesWiltgen/tuneup-releases/releases/download/v0.9.1-rc.1/tuneup-macos-x86_64.tar.gz"
      sha256 "a37200f54c7679df59d67b3f44218cef1806b7b895b247b2fedddd1e77358341"
    end
  end

  on_linux do
    url "https://github.com/CharlesWiltgen/tuneup-releases/releases/download/v0.9.1-rc.1/tuneup-linux-x86_64.tar.gz"
    sha256 "daec2ed004b1b4fa7fefd180f4985280e143a45d85164eecc2e9cda1f3027603"
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