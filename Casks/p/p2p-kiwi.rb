cask "p2p-kiwi" do
  arch arm: "arm64", intel: "x86_64"
  url_end = on_system_conditional macos: "universal.dmg", linux: "#{arch}.AppImage"

  version "2.0.1"
  sha256 arm:          "9dea64a41ffa74cf17f37819d35b3c5cd6c5d26ffbd34b3dd545c1b66bc182c4",
         intel:        "9dea64a41ffa74cf17f37819d35b3c5cd6c5d26ffbd34b3dd545c1b66bc182c4",
         arm64_linux:  "4500007a5f585cc6fa62f8a517825820ecf383d5633bbb276081c2dadae55cd2",
         x86_64_linux: "2065de4502160095d49c6734e000c603c9729adaa6b47ac240d4a2b2d7685cff"

  on_macos do
    depends_on macos: :ventura

    app "p2p.kiwi.app"

    zap trash: [
      "~/Library/Application Support/bananas",
      "~/Library/Preferences/net.getbananas.app.plist",
      "~/Library/Saved Application State/net.getbananas.app.savedState",
    ]
  end
  on_linux do
    app_image "p2p-kiwi_#{arch}.AppImage", target: "p2p.kiwi.AppImage"
  end

  url "https://github.com/dont-be-evil-company/p2p.kiwi/releases/download/v#{version}/p2p-kiwi_#{url_end}"
  name "p2p.kiwi"
  desc "Cross-platform screen sharing tool"
  homepage "https://p2p.kiwi/"
end
