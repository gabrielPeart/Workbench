import AppKit
import Cake

class RootViewController: NSViewController {
    @IBOutlet var downloadButton: NSButton!
    @IBOutlet var uploadButton: NSButton!
    @IBOutlet var versionLabel: NSTextField!
    @IBOutlet var addButton: NSButton!

    override func viewDidLoad() {
        versionLabel.stringValue = "Workbench \(Bundle.main.version)"
    }

    @IBAction func onMiscClicked(_ sender: Any) {
        let isOptionPressed = NSEvent.modifierFlags.contains(.option)

        let menu = NSMenu()
        menu.addItem(.init(title: "About Workbench…", action: #selector(onAboutClicked), keyEquivalent: ""))
        if isOptionPressed {
            menu.addItem(.init(title: "Check for Updates…", action: #selector(AppDelegate.checkForUpdates), keyEquivalent: ""))
        }
        menu.addItem(.separator())
        menu.addItem(.init(title: "Donate…", action: #selector(onDonateClicked), keyEquivalent: ""))
        menu.addItem(.separator())
        menu.addItem(.init(title: "Quit Workbench", action: #selector(NSApplication.terminate), keyEquivalent: "q"))
        menu.popUp(withCorrectThemePositioningItem: menu.item(at: 0), atLocation: NSEvent.mouseLocation)
    }

    @objc func onAboutClicked(_ sender: Any) {
        NSWorkspace.shared.open(URL(string: "http://github.com/mxcl/Workbench")!)
        closeWindow()
    }

    @objc func onDonateClicked(_ sender: Any) {
        NSWorkspace.shared.open(URL(string: "http://www.patreon.com/mxcl")!)
        closeWindow()
    }

    private func closeWindow() {
        //TODO less coupling
        (NSApp.delegate as? AppDelegate)?.close()
    }
}
