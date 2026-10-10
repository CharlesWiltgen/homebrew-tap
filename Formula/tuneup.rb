class Tuneup < Formula
  desc "Command-line music utility showcasing taglib-wasm capabilities"
  homepage "https://github.com/CharlesWiltgen/tuneup"
  version "0.9.2-rc.2"
  license "MIT"

  # macOS arm64 only: Intel macOS is no longer built, so there is no else
  # branch to fall back to and no Intel checksum to substitute.
  on_macos do
    url "https://github.com/CharlesWiltgen/tuneup-releases/releases/download/v0.9.2-rc.2/tuneup-macos-arm64.tar.gz"
    sha256 "02f1281443e6646344f762cffa10108e73d9e2be09d1dfa45c392f72d58e9b09"
  end

  on_linux do
    # The SEA binary is Node, and Node's own Linux linkage is against
    # libatomic.so.1, so the Linux artefact needs it too (tuneup-n8b). There is
    # no `libatomic` formula to depend on, so the requirement is stated in
    # caveats below instead; Homebrew on Linux has libatomic anyway, because
    # its build-tool prerequisites install it.
    url "https://github.com/CharlesWiltgen/tuneup-releases/releases/download/v0.9.2-rc.2/tuneup-linux-x86_64.tar.gz"
    sha256 "636353449e88abd3ae64f4781f938fe76777fe1dbd22e304f87e51a79e2414db"
  end

  def install
    if OS.mac?
      bin.install "tuneup-macos-arm64" => "tuneup"
    else
      bin.install "tuneup-linux-x86_64" => "tuneup"
    end
  end

  def caveats
    return unless OS.linux?

    <<~EOS
      tuneup is a Node single-executable binary, so on Linux it links
      libatomic.so.1 (Node's own linkage, not tuneup's). Homebrew on Linux
      installs it with its build tools, so it is normally already present; on a
      minimal system install it first — Debian/Ubuntu `libatomic1`, Fedora
      `libatomic`, Arch `gcc-libs` — or tuneup will not start.
    EOS
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/tuneup --version")
  end
end