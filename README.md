# Chocobaki

Chocobaki is a lightweight macOS utility that copies music/video URLs to the clipboard and immediately previews them inside the app using `AVPlayer`.

## Current project layout

```
Chocobaki/
├── AppDelegate.swift       // App lifecycle entry point
├── ViewController.swift    // UI logic for copying and playback
└── README.md
```

The repository snapshot focuses on the core Swift sources. You can recreate the full Xcode project by adding:

- `Chocobaki.xcodeproj` with a macOS App target.
- `Base.lproj/Main.storyboard` containing a text field (for the URL), a button wired to the action below, an `AVPlayerView`, and a status `NSTextField`.
- `Assets.xcassets` with your app icon set.
- `Info.plist` that includes any App Transport Security (ATS) exceptions your media URLs require (e.g., `NSAllowsArbitraryLoads` during development).

## View controller behavior

`ViewController.swift` wires the UI to the clipboard and media playback:

- Reads and trims the URL from the text field when the button is clicked.
- Validates that the string is a valid URL with a scheme; otherwise updates the status label with `"Invalid URL"`.
- Writes the URL to the general pasteboard and shows a `"Copied to clipboard!"` status message.
- Instantiates `AVPlayer` with the URL, assigns it to the `AVPlayerView`, and starts playback.

## Next steps

- Hook up the outlets/actions in Interface Builder to match the properties in `ViewController.swift`.
- Add basic error handling for unreachable URLs or playback failures.
- Refine ATS settings to limit allowed domains once your media sources are known.
