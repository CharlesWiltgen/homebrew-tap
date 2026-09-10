class Tuneup < Formula
  desc "Command-line music utility showcasing taglib-wasm capabilities"
  homepage "https://github.com/CharlesWiltgen/tuneup"
  version "0.9.2-rc.1"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/CharlesWiltgen/tuneup-releases/releases/download/v0.9.2-rc.1/tuneup-macos-arm64.tar.gz"
      sha256 "9042f57f12f3f4cc61733ad1fd17cb3f526612c7d4f0386fbdbcf9f087778bdb"
    else
      url "https://github.com/CharlesWiltgen/tuneup-releases/releases/download/v0.9.2-rc.1/tuneup-macos-x86_64.tar.gz"
      sha256 "83317c560167b4735d0522f00cf72954ccad8abd2dd81d303966c96fe7972bf2"
    end
  end

  on_linux do
    url "https://github.com/CharlesWiltgen/tuneup-releases/releases/download/v0.9.2-rc.1/tuneup-linux-x86_64.tar.gz"
    sha256 "9d8c510880b96089d7124ef765e31bd5cec242e9a98d58a70cfb0b8ce5428515"
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