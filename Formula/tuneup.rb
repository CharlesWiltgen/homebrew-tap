class Tuneup < Formula
  desc "Command-line music utility showcasing taglib-wasm capabilities"
  homepage "https://github.com/CharlesWiltgen/tuneup"
  version "0.9.1"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/CharlesWiltgen/tuneup-releases/releases/download/v0.9.1/tuneup-macos-arm64.tar.gz"
      sha256 "3f41bbbc4151852932b0a0e9d81bae69594c7f7a92e67af3da28d4d563f00ab1"
    else
      url "https://github.com/CharlesWiltgen/tuneup-releases/releases/download/v0.9.1/tuneup-macos-x86_64.tar.gz"
      sha256 "7eeaf8d235fb3eac2f7b0da82133bc997b1c897fc04f5db2978c26f4bb3b2e54"
    end
  end

  on_linux do
    url "https://github.com/CharlesWiltgen/tuneup-releases/releases/download/v0.9.1/tuneup-linux-x86_64.tar.gz"
    sha256 "3b26aba484819d4a877cc9f319c93909a6b919afa0e6cbc61b7063c939b3cfff"
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