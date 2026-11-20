# The Homebrew cask, rendered by macos/publish.sh (or release.yml) into
# kopilati/convene-releases as Casks/convene.rb — tapped with
# `brew tap kopilati/releases https://github.com/kopilati/convene-releases`.
# The version, the two checksums and the repository the zips are released in are filled in.
cask "convene" do
  # `arch` comes first: the url below interpolates it when the stanza is read, and an arch
  # declared after it rendered "macos-.zip" (F633).
  arch arm: "arm64", intel: "x86_64"

  version "0.7.0"
  sha256 arm: "87acfbacda662586e68dd98ca85870544bd0baea9902e7d7323415f4fd0ab643", intel: "4f6ecb0fa809bf5bc42d10892d7fb13b4c6eeb7ce25f0cec6b7a7d0437ec66a3"

  url "https://github.com/kopilati/convene-releases/releases/download/v#{version}/Convene-#{version}-macos-#{arch}.zip"
  name "Convene"
  desc "Private group chat over a mix-net swarm"
  homepage "https://github.com/kopilati/convene"

  app "Convene.app"

  # Unless the release was notarised, Gatekeeper refuses the first launch: System Settings >
  # Privacy & Security > Open Anyway. Homebrew no longer has --no-quarantine (macos/INSTALL.md).
  caveats do
    <<~EOS
      If macOS says it could not verify Convene, click Done, open System Settings >
      Privacy & Security and click Open Anyway beside Convene, once. Or, for this app alone:
        xattr -dr com.apple.quarantine /Applications/Convene.app
    EOS
  end

  zap trash: "~/Library/Application Support/info.nordhavn.convene"
end
