cask "opossum-desktop" do
  version "0.2.0"
  sha256 "391f534eed7f784612fd95a22dbca55b5ed24c9123a023d454a42e8619e12188"

  url "https://github.com/warrenseine/opossum-desktop/releases/download/v#{version}/OpossumDesktop-#{version}.zip"
  name "Opossum Desktop"
  desc "GUI for opossum, the Docker-Desktop-like orchestrator for the container runtime"
  homepage "https://github.com/warrenseine/opossum-desktop"

  depends_on cask: "suruseas/opossum/opossum"
  depends_on formula: "container"
  depends_on macos: :tahoe

  app "Opossum Desktop.app"

  zap trash: [
    "~/Library/Application Support/OpossumDesktop",
    "~/Library/Preferences/ai.opossum-desktop.app.plist",
    "~/Library/Saved Application State/ai.opossum-desktop.app.savedState",
  ]

  caveats <<~EOS
    Opossum Desktop is unsigned (no Apple Developer ID yet). On first launch, Gatekeeper will
    refuse to open it — right-click the app in Finder and choose "Open" once to approve it,
    or run:
      xattr -dr com.apple.quarantine "/Applications/Opossum Desktop.app"
  EOS
end
