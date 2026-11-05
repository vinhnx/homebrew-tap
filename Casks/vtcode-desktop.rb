cask "vtcode-desktop" do
  version "0.181.4"
  sha256 "0d80365e3107c856fe758360c5c43846711fd9b4143fdada43801194725c2f83"

  url "https://github.com/vinhnx/vtcode/releases/download/#{version}/vtcode-desktop-#{version}-aarch64-apple-darwin.zip"
  name "VT Code"
  desc "Desktop app for the VT Code terminal coding agent"
  homepage "https://github.com/vinhnx/vtcode"

  depends_on macos: :sequoia
  depends_on arch: :arm64

  app "VT Code.app"

  zap trash: [
    "~/.vtcode/desktop",
    "~/Library/Application Support/com.vinhnx.vtcode.desktop",
    "~/Library/Caches/com.vinhnx.vtcode.desktop",
    "~/Library/Preferences/com.vinhnx.vtcode.desktop.plist",
    "~/Library/Saved Application State/com.vinhnx.vtcode.desktop.savedState",
  ]

  caveats <<~EOS
    VT Code Desktop reuses the VT Code CLI configuration and provider credentials.
    Install the CLI too if you want terminal access:

      brew install vinhnx/tap/vtcode

    Release builds are ad hoc signed unless the release notes say they are notarized.
    If macOS blocks the first launch, right-click VT Code.app in Applications and
    choose Open, or allow it once in System Settings > Privacy & Security.

    The desktop cask currently ships Apple Silicon builds; Intel Macs can still
    install from source with `vtcode desktop --install`.
  EOS
end
