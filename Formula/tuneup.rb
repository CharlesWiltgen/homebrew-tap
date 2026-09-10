class Tuneup < Formula
  desc "Command-line music utility showcasing taglib-wasm capabilities"
  homepage "https://github.com/CharlesWiltgen/tuneup"
  version "0.9.2-rc.1"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/CharlesWiltgen/tuneup-releases/releases/download/v0.9.2-rc.1/tuneup-macos-arm64.tar.gz"
      sha256 "468baeb60f545577573b892dc1b25c6aef17c3ac813ae8c4623e7021a4389d93"
    else
      url "https://github.com/CharlesWiltgen/tuneup-releases/releases/download/v0.9.2-rc.1/tuneup-macos-x86_64.tar.gz"
      sha256 "30160127788486c5205e3aa0288b9c3775d76c734076e48c79e42ca2ac59921b"
    end
  end

  on_linux do
    url "https://github.com/CharlesWiltgen/tuneup-releases/releases/download/v0.9.2-rc.1/tuneup-linux-x86_64.tar.gz"
    sha256 "a8fde5c3f94c033413b23b942353823fc397b019700ca48d090584c7f516cd3a"
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