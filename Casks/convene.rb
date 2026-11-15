# The Homebrew cask, rendered by release.yml into kopilati/convene-releases as Casks/convene.rb
# — tapped with `brew tap kopilati/releases https://github.com/kopilati/convene-releases`.
# 0.4.0, 9de38a061646728049c279854bebedd23e2c276af9969aaf448539834bb6f7ce and a5eb6896807a8d10e85a04cfa6d63aa620d0071c9514e16cdc8b3fa66e129001 are filled from the release's zips.
cask "convene" do
  version "0.4.0"
  sha256 arm: "9de38a061646728049c279854bebedd23e2c276af9969aaf448539834bb6f7ce", intel: "a5eb6896807a8d10e85a04cfa6d63aa620d0071c9514e16cdc8b3fa66e129001"

  url "https://github.com/kopilati/convene/releases/download/v#{version}/Convene-#{version}-macos-#{arch}.zip",
      verified: "github.com/kopilati/convene/"
  name "Convene"
  desc "Private group chat over a mix-net swarm"
  homepage "https://github.com/kopilati/convene"

  arch arm: "arm64", intel: "x86_64"

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
