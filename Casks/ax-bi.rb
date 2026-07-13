cask "ax-bi" do
  version "0.1.0"
  sha256 "09b7b9b2c4e9e7f9963fa965b62db8e2f623cc3043e05629d12f335cbd34afdc"

  url "https://github.com/defai-digital/ax-bi/releases/download/ax-bi-desktop-v0.1.0/AX.BI_#{version}_aarch64.dmg",
      verified: "github.com/defai-digital/ax-bi/"
  name "AX BI"
  desc "Desktop client and local runtime launcher for AX BI"
  homepage "https://github.com/defai-digital/ax-bi"

  depends_on arch: :arm64
  depends_on macos: :monterey
  depends_on formula: "colima"
  depends_on formula: "docker"
  depends_on formula: "docker-compose"

  preflight do
    # Clears any pre-existing bundle so upgrades from untracked installs do not
    # hit Homebrew's "already an App" guard.
    FileUtils.rm_rf("#{appdir}/AX BI.app")
  end

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
