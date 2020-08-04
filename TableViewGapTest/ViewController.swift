import Cocoa

class ViewController: NSViewController {
    @IBOutlet var tableView: NSTableView?
    private let data = LineResult.stub

    override func viewDidLoad() {
        super.viewDidLoad()
    }
}

extension ViewController: NSTableViewDelegate {
    func tableView(_ tableView: NSTableView, viewFor tableColumn: NSTableColumn?, row: Int) -> NSView? {
        guard let cell = tableView.makeView(withIdentifier: inlineCellIdentifier, owner: self) as? NSTableCellView else { preconditionFailure("Failed to create results cell") }
        cell.textField?.stringValue = data[row].displayString ?? ""
        return cell
    }
}

extension ViewController: NSTableViewDataSource {
    func numberOfRows(in tableView: NSTableView) -> Int {
        data.count
    }
    
    func tableView(_ tableView: NSTableView, objectValueFor tableColumn: NSTableColumn?, row: Int) -> Any? {
        data[row]
    }
}

private let inlineCellIdentifier = NSUserInterfaceItemIdentifier("InlineCell")
