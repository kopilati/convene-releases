# The Homebrew cask, rendered by macos/publish.sh (or release.yml) into
# kopilati/convene-releases as Casks/convene.rb — tapped with
# `brew tap kopilati/releases https://github.com/kopilati/convene-releases`.
# The version, the two checksums and the repository the zips are released in are filled in.
cask "convene" do
  # `arch` comes first: the url below interpolates it when the stanza is read, and an arch
  # declared after it rendered "macos-.zip" (F633).
  arch arm: "arm64", intel: "x86_64"

  version "0.7.1"
  sha256 arm: "9cc177b0bb650c54cd3187e442e522eba220ca1f3899b7540b92b487e142fabd", intel: "d4715b533a4ff2a7c0a3d9367b4c997cd8557ce5ae01ee071c45303fc66e8e74"

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
