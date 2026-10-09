class Tuneup < Formula
  desc "Command-line music utility showcasing taglib-wasm capabilities"
  homepage "https://github.com/CharlesWiltgen/tuneup"
  version "0.9.2-rc.1"
  license "MIT"

  # macOS arm64 only: Intel macOS is no longer built, so there is no else
  # branch to fall back to and no Intel checksum to substitute.
  on_macos do
    url "https://github.com/CharlesWiltgen/tuneup-releases/releases/download/v0.9.2-rc.1/tuneup-macos-arm64.tar.gz"
    sha256 "bf32f1475659b5ca101abf0f6c4bd16c27d0ac70fa2a74ae63955f8ee5608fda"
  end

  on_linux do
    url "https://github.com/CharlesWiltgen/tuneup-releases/releases/download/v0.9.2-rc.1/tuneup-linux-x86_64.tar.gz"
    sha256 "d4377e3913f843c751cc8ab5ba89baccd2de69033ac07935f1c0d9e851ec5b09"
  end

  def install
    if OS.mac?
      bin.install "tuneup-macos-arm64" => "tuneup"
    else
      bin.install "tuneup-linux-x86_64" => "tuneup"
    end
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/tuneup --version")
  end
end