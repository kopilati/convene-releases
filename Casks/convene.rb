# The Homebrew cask, rendered by release.yml into kopilati/convene-releases as Casks/convene.rb
# — tapped with `brew tap kopilati/releases https://github.com/kopilati/convene-releases`.
# The version and the two checksums below are filled from the release's zips.
cask "convene" do
  # `arch` comes first: the url below interpolates it when the stanza is read, and an arch
  # declared after it rendered "macos-.zip" (F633).
  arch arm: "arm64", intel: "x86_64"

  version "0.5.0"
  sha256 arm: "ffc5974694a6e1caa13fe3ab022a3e6022d73b60a35a20011defc5680760fd63", intel: "c74b9c6d66a79cbf36650fbb175bd40c515db0ebaf48ff0162696cb1f3160964"

  url "https://github.com/kopilati/convene/releases/download/v#{version}/Convene-#{version}-macos-#{arch}.zip"
  name "Convene"
  desc "Private group chat over a mix-net swarm"
  homepage "https://github.com/kopilati/convene"

  app "Convene.app"

  # Unless the release was notarised, Gatekeeper asks on first launch: System Settings >
  # Privacy & Security > Open Anyway, or `brew install --cask --no-quarantine convene`.
  caveats do
    <<~EOS
      If macOS says it could not verify Convene, open System Settings > Privacy & Security
      and click Open Anyway, once. Or install with --no-quarantine.
    EOS
  end

  zap trash: "~/Library/Application Support/info.nordhavn.convene"
end
