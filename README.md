# Homebrew Tap

Formulae and casks for [Charles Wiltgen](https://github.com/CharlesWiltgen)'s
macOS tools.

## tuneup

The `tuneup` command-line tool and the Tuneup desktop app. Both are Apple
silicon (arm64) only.

Install the command-line tool:

```bash
brew install CharlesWiltgen/tap/tuneup
```

Install the desktop app (signed and notarised):

```bash
brew install --cask CharlesWiltgen/tap/tuneup
```

Installing by the fully qualified name (`user/repo/name`) trusts just that
formula or cask, so no separate trust step is needed. To install by short name
instead, Homebrew 6 asks for the item to be trusted first:

```bash
brew tap CharlesWiltgen/tap

brew trust --formula CharlesWiltgen/tap/tuneup
brew install tuneup

brew trust --cask CharlesWiltgen/tap/tuneup
brew install --cask tuneup
```

`brew trust CharlesWiltgen/tap` trusts the whole tap — every current and future
formula and cask — which is broader than these two need. See
[Tap Trust](https://docs.brew.sh/Tap-Trust).
