# Chocobaki
A macOS app to copy music/video links and preview them inside the app.
import Cocoa
import AVKit

class ViewController: NSViewController {

    @IBOutlet weak var urlTextField: NSTextField!
    @IBOutlet weak var playerView: AVPlayerView!
    @IBOutlet weak var statusLabel: NSTextField!

    @IBAction func copyButtonClicked(_ sender: Any) {
        let pasteboard = NSPasteboard.general
        let urlString = urlTextField.stringValue.trimmingCharacters(in: .whitespacesAndNewlines)
        
        guard let url = URL(string: urlString), url.scheme != nil else {
            statusLabel.stringValue = "Invalid URL"
            return
        }
        
        pasteboard.clearContents()
        pasteboard.setString(urlString, forType: .string)
        statusLabel.stringValue = "Copied to clipboard!"
        
        playMedia(from: url)
    }

    private func playMedia(from url: URL) {
        let player = AVPlayer(url: url)
        playerView.player = player
        player.play()
    }
}
<key>NSAppTransportSecurity</key>
<dict>
    <key>NSAllowsArbitraryLoads</key>
    <true/>
</dict>
Chocobaki/
├── Chocobaki.xcodeproj/          ← Xcode project file
├── Chocobaki/
│   ├── AppDelegate.swift
│   ├── Assets.xcassets/
│   │   └── AppIcon.appiconset/
│   ├── Base.lproj/
│   │   └── Main.storyboard
│   ├── Info.plist
│   └── ViewController.swift
└── README.md
import Cocoa

@main
class AppDelegate: NSObject, NSApplicationDelegate {
    func applicationDidFinishLaunching(_ aNotification: Notification) { }
    func applicationWillTerminate(_ aNotification: Notification) { }
}
import Cocoa
import AVKit

class ViewController: NSViewController {

    @IBOutlet weak var urlTextField: NSTextField!
    @IBOutlet weak var playerView: AVPlayerView!
    @IBOutlet weak var statusLabel: NSTextField!

    @IBAction func copyButtonClicked(_ sender: Any) {
        let urlString = urlTextField.stringValue.trimmingCharacters(in: .whitespacesAndNewlines)
        guard let url = URL(string: urlString), url.scheme != nil else {
            statusLabel.stringValue = "Invalid URL"
            return
        }

        let pasteboard = NSPasteboard.general
        pasteboard.clearContents()
        pasteboard.setString(urlString, forType: .string)
        statusLabel.stringValue = "Copied to clipboard!"

        playMedia(from: url)
    }

    private func playMedia(from url: URL) {
        let player = AVPlayer(url: url)
        playerView.player = player
        player.play()
    }
}
<key>NSAppTransportSecurity</key>
<dict>
    <key>NSAllowsArbitraryLoads</key>
    <true/>
</dict>
@IBOutlet weak var urlTextField: NSTextField!
@IBOutlet weak var playerView: AVPlayerView!
@IBOutlet weak var statusLabel: NSTextField!

@IBAction func copyButtonClicked(_ sender: Any) {
    let urlString = urlTextField.stringValue.trimmingCharacters(in: .whitespacesAndNewlines)
    guard let url = URL(string: urlString), url.scheme != nil else {
        statusLabel.stringValue = "Invalid URL"
        return
    }

    let pasteboard = NSPasteboard.general
    pasteboard.clearContents()
    pasteboard.setString(urlString, forType: .string)
    statusLabel.stringValue = "Copied to clipboard!"

    playMedia(from: url)
}

private func playMedia(from url: URL) {
    let player = AVPlayer(url: url)
    playerView.player = player
    player.play()
}
