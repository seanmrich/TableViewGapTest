import Cocoa

class ViewController: NSViewController {
    @IBOutlet var tableView: NSTableView?
    private let mainSection = Section()
    private var resultsDataSource: NSTableViewDiffableDataSourceReference<Section, LineResult>!

    override func viewDidLoad() {
        super.viewDidLoad()
        configureDatasource()
    }

    private func configureDatasource() {
        guard let table = tableView else { return assertionFailure() }
        resultsDataSource = NSTableViewDiffableDataSourceReference(tableView: table) { tableView, column, row, item in
            guard let cell = tableView.makeView(withIdentifier: inlineCellIdentifier, owner: self) as? NSTableCellView else { preconditionFailure("Failed to create results cell") }
            cell.textField?.stringValue = (item as? LineResult)?.displayString ?? ""
            return cell
        }
        let snapshot = resultsDataSource.snapshot()
        snapshot.appendSections(withIdentifiers: [mainSection])
        snapshot.appendItems(withIdentifiers: LineResult.stub)
        resultsDataSource.applySnapshot(snapshot, animatingDifferences: false)
    }

    final class Section {}
}

private let inlineCellIdentifier = NSUserInterfaceItemIdentifier("InlineCell")
