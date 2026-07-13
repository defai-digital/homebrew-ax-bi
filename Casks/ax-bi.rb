cask "ax-bi" do
  version "0.0.0"
  sha256 :no_check

  # Replaced by CI on each ax-bi-desktop-v* release with a real DMG URL + sha256.
  url "https://github.com/defai-digital/ax-bi/releases/download/ax-bi-desktop-v#{version}/AX.BI_#{version}_aarch64.dmg",
      verified: "github.com/defai-digital/ax-bi/"
  name "AX BI"
  desc "Desktop client and local runtime launcher for AX BI"
  homepage "https://github.com/defai-digital/ax-bi"

  depends_on arch: :arm64
  depends_on macos: ">= :monterey"
  depends_on formula: "colima"
  depends_on formula: "docker"
  depends_on formula: "docker-compose"

  # First real release will overwrite this file with a production sha256 and version.
  # Until then, brew install will fail at download (expected).
  app "AX BI.app"

  postflight do
    system_command "/usr/bin/xattr",
                   args: ["-cr", "#{appdir}/AX BI.app"]
  end

  zap trash: [
    "~/Library/Application Support/com.axbi.desktop",
    "~/Library/Caches/com.axbi.desktop",
    "~/Library/Logs/com.axbi.desktop",
    "~/Library/Preferences/com.axbi.desktop.plist",
    "~/Library/Saved Application State/com.axbi.desktop.savedState",
  ]
end
