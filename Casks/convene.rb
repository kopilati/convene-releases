# The Homebrew cask, rendered by release.yml into kopilati/convene-releases as Casks/convene.rb
# — tapped with `brew tap kopilati/releases https://github.com/kopilati/convene-releases`.
# The version and the two checksums below are filled from the release's zips.
cask "convene" do
  # `arch` comes first: the url below interpolates it when the stanza is read, and an arch
  # declared after it rendered "macos-.zip" (F633).
  arch arm: "arm64", intel: "x86_64"

  version "v0.6.0"
  sha256 arm: "c1a116f33395140d09f60f148eba828c7fd79786c1a2a164bc4c795325bd4372", intel: "8f36ba7b19da3b8e640c74774e03080eb9d241f255a115fa35f8077e216bee1e"

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
