cask "ax-bi" do
  version "2.0.3"
  sha256 "e56096422d9483ab2ab1ba4343b02d9e23566527d807f73e2e790d61cb8d0e6b"

  url "https://github.com/defai-digital/ax-bi/releases/download/ax-bi-desktop-v2.0.3/AX.BI_#{version}_aarch64.dmg",
      verified: "github.com/defai-digital/ax-bi/"
  name "AX BI"
  desc "Desktop client and local runtime launcher for AX BI"
  homepage "https://github.com/defai-digital/ax-bi"

  depends_on arch: :arm64
  depends_on macos: :monterey
  depends_on formula: "colima"
  depends_on formula: "docker"
  depends_on formula: "docker-compose"

  app "AX BI.app"

  preflight do
    # Clears any pre-existing bundle so upgrades from untracked installs do not
    # hit Homebrew's "already an App" guard.
    app_path = "#{appdir}/AX BI.app"
    FileUtils.rm_r(app_path) if File.exist?(app_path)
  end

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
