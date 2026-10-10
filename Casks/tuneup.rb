cask "tuneup" do
  # Rendered by .github/workflows/homebrew-update.yml with the same sed
  # placeholder convention as Formula/tuneup.rb.template. The checksum is the
  # one published beside Tuneup-<version>-arm64.zip in the release, so the cask
  # exists only for releases the GUI job actually published (it builds, verifies
  # and uploads the app only when the signing and notarisation credentials are
  # present — docs/RELEASING.md, "Publishing the GUI app").
  version "0.9.2-rc.1"
  sha256 "0000000000000000000000000000000000000000000000000000000000000001"

  # arm64 only, exactly like the formula: electron-builder packages
  # `--mac --arm64` (electron-builder.yml), and there is no Intel build to fall
  # back to.
  depends_on arch: :arm64

  url "https://github.com/CharlesWiltgen/tuneup-releases/releases/download/v0.9.2-rc.1/Tuneup-0.9.2-rc.1-arm64.zip"
  name "Tuneup"
  desc "Desktop music metadata utility built on taglib-wasm"
  homepage "https://github.com/CharlesWiltgen/tuneup"

  app "Tuneup.app"

  # The vendor binaries (fpcalc, rsgain) are extracted from the bundle into
  # `~/Library/Caches/tuneup` on first use, and Electron's own profile lands in
  # `~/Library/Application Support/tuneup-node` — the directory Electron derives
  # from the app's package.json `name`, which is the CLI's `tuneup-node`.
  zap trash: [
    "~/Library/Application Support/tuneup-node",
    "~/Library/Caches/tuneup",
  ]
end
