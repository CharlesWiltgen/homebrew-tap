cask "tuneup" do
  # Rendered by .github/workflows/homebrew-update.yml with the same sed
  # placeholder convention as Formula/tuneup.rb.template. The checksum is the
  # one published beside Tuneup-<version>-arm64.zip in the release, so the cask
  # exists only for releases the GUI job actually published (it builds, verifies
  # and uploads the app only when the signing and notarisation credentials are
  # present — docs/RELEASING.md, "Publishing the GUI app").
  version "0.9.2-rc.2"
  sha256 "c397b55ef54b1283cdafd9ef088e9ef4144e0995a479d8f4dd5b5a9d8b3d31a1"

  # `#{version}`, not the `0.9.2-rc.2` placeholder the sed render also knows:
  # `brew audit` reads a url stanza that carries no `#{…}` interpolation as
  # unversioned and then demands `sha256 :no_check` — measured with
  # `brew audit --cask` on the rendered file: "Use `sha256 :no_check` when URL
  # is unversioned." `version` above is still set from the placeholder, so this
  # interpolates to the release's version (verified: 0.9.2 renders the same url
  # the placeholder did).
  url "https://github.com/CharlesWiltgen/tuneup-releases/releases/download/v#{version}/Tuneup-#{version}-arm64.zip"
  name "Tuneup"
  desc "Desktop music metadata utility built on taglib-wasm"
  homepage "https://github.com/CharlesWiltgen/tuneup"

  # arm64 only, exactly like the formula: electron-builder packages
  # `--mac --arm64` (electron-builder.yml), and there is no Intel build to fall
  # back to. `depends_on :macos` is what `brew style --cask` adds for a
  # macOS-only cask — redundant for a cask in practice, but the
  # Homebrew/OSDependsOn cop is not satisfied without it (and `brew style` exits
  # 1, which is what a tap with CI would gate on).
  depends_on arch: :arm64
  depends_on :macos

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
