# Installing Convene

Convene is a private group chat with no server in it: every record is sealed to the people it
is for and left at pigeonholes nobody in the middle can read. The source, the releases and the
issues are at [kopilati/convene](https://github.com/kopilati/convene); the protocol is at
[kopilati/convene-specs](https://github.com/kopilati/convene-specs). This repository is where
the Homebrew cask and the apt repository live, written by the release workflow on every tag.
Nothing here is edited by hand.

## macOS

With Homebrew, once:

```
brew tap kopilati/releases https://github.com/kopilati/convene-releases
brew install --cask convene
```

and `brew upgrade --cask convene` from then on. Or download `Convene-<version>-macos-arm64.zip`
(Apple silicon) or `-x86_64.zip` (Intel) from the
[releases](https://github.com/kopilati/convene/releases), unzip it and drag Convene.app into
Applications.

If the release was not notarised, macOS 15 and later refuse the first launch with *Move to Bin*
or *Done*: click Done, open System Settings › Privacy & Security, scroll to Security, click
*Open Anyway* beside Convene, then Open. Once per Mac. Or install with
`brew install --cask --no-quarantine convene`, or run
`xattr -dr com.apple.quarantine /Applications/Convene.app`.

## Linux

Debian, Ubuntu and their relatives, from the apt repository served from this repository's
`docs/`:

```
curl -fsSL https://kopilati.github.io/convene-releases/convene.gpg | sudo tee /usr/share/keyrings/convene.gpg >/dev/null
echo "deb [signed-by=/usr/share/keyrings/convene.gpg] https://kopilati.github.io/convene-releases stable main" | sudo tee /etc/apt/sources.list.d/convene.list
sudo apt update && sudo apt install convene
```

and `sudo apt upgrade` from then on. Or `sudo dpkg -i convene_<version>_amd64.deb` from the
[releases](https://github.com/kopilati/convene/releases), or unpack
`convene-<version>-linux-x86_64.tar.gz` anywhere and run `convene`. The package puts `convene`
on the path and an entry in the applications menu.

## Windows

With Chocolatey:

```
choco install convene
```

and `choco upgrade convene` from then on. Or download `convene-<version>-windows-x86_64.zip`
from the [releases](https://github.com/kopilati/convene/releases), unzip it and run
`convene.exe`.

## iPhone

Through TestFlight while the app is in testing: a public TestFlight link is posted on the
[releases](https://github.com/kopilati/convene/releases) page when one exists. The App Store,
once it is there.

## The web

The chat as a web component, for a page of your own:

```
npm install @nordhavn/convene
```

```html
<script type="module">import "@nordhavn/convene";</script>
<convene-chat></convene-chat>
```

[kopilati/convene `web/README.md`](https://github.com/kopilati/convene/blob/main/web/README.md)
describes the element's attributes and the relay it talks to.

## What is in this repository

- `Casks/convene.rb` — the Homebrew cask, pointing at the Mac zips of the latest release with
  their checksums.
- `docs/` — the apt repository: `dists/stable`, `pool/main`, the signed `Release` and
  `InRelease`, and `convene.gpg`, the public key users install. GitHub Pages serves it.

Both are rewritten by [`release.yml`](https://github.com/kopilati/convene/blob/main/.github/workflows/release.yml)
in kopilati/convene on every tag.
