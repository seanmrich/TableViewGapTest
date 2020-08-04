final class LineResult {
    var lineNumber: Int
    var type: ResultType
    
    init(line: Int, type: ResultType) {
        self.lineNumber = line
        self.type = type
    }
    
    var displayString: String? {
        switch type {
        case .empty: return nil
        case .inline(let displayString): return displayString
        }
    }
        
    enum ResultType: Hashable {
        case empty
        case inline (String)
    }
    
    static let stub: [LineResult] = [
        .init(line: 0, type: .inline("123"))
    ]
}
