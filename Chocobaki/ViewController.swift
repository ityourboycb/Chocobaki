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
