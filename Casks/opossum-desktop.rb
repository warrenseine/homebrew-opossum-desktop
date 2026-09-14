cask "opossum-desktop" do
  version "0.2.1"
  sha256 "4504533eceafa709bd00cd19f48295503839926c92e10ee4bc3d214dbe0c30ef"

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
