cask "dropbox-beta" do
  version "123.3.4808"
  sha256 "b459b81fc0dccb28e1c6ce91aaf836761ed4c576e583c13412bd0bd89d0bdd83"

  url "https://www.dropbox.com/download?build=#{version}&plat=mac&type=full",
      verified: "dropbox.com/"
  name "Dropbox"
  desc "Client for the Dropbox cloud storage service"
  homepage "https://www.dropboxforum.com/t5/Desktop-client-builds/bd-p/101003016"

  livecheck do
    url :homepage
    strategy :page_match
    regex(/Beta\sBuild\s(\d+(?:\.\d+)*)/i)
  end

  auto_updates true
  conflicts_with cask: "dropbox"

  app "Dropbox.app"

  uninstall launchctl: "com.dropbox.DropboxMacUpdate.agent"

  zap trash: [
    "/Library/DropboxHelperTools",
    "~/.dropbox",
    "~/Library/Application Scripts/com.dropbox.foldertagger",
    "~/Library/Application Scripts/com.getdropbox.dropbox.garcon",
    "~/Library/Application Support/Dropbox",
    "~/Library/Caches/CloudKit/com.apple.bird/iCloud.com.getdropbox.Dropbox",
    "~/Library/Caches/com.dropbox.DropboxMacUpdate",
    "~/Library/Caches/com.getdropbox.DropboxMetaInstaller",
    "~/Library/Caches/com.getdropbox.dropbox",
    "~/Library/Caches/com.plausiblelabs.crashreporter.data/com.dropbox.DropboxMacUpdate",
    "~/Library/Containers/com.dropbox.foldertagger",
    "~/Library/Containers/com.getdropbox.dropbox.garcon",
    "~/Library/Dropbox",
    "~/Library/Group Containers/com.getdropbox.dropbox.garcon",
    "~/Library/LaunchAgents/com.dropbox.DropboxMacUpdate.agent.plist",
    "~/Library/Logs/Dropbox_debug.log",
    "~/Library/Preferences/com.dropbox.DropboxMacUpdate.plist",
    "~/Library/Preferences/com.dropbox.DropboxMonitor.plist",
    "~/Library/Preferences/com.dropbox.tungsten.helper.plist",
    "~/Library/Preferences/com.getdropbox.dropbox.plist",
  ]
end
