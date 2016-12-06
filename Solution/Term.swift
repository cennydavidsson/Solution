enum Term {
    case number(Int)
    case `operator`(OperatorType)
    case parenthese(ParenthesesType)
    
    enum ParenthesesType: String {
        case open   = "("
        case closed = ")"
    }
    
    enum OperatorType: String {
        case addition       = "+"
        case subtraction    = "-"
        case multiplication = "*"
    }
}

extension Term {
    init?(string: String) {
        if let `operator` = Term.OperatorType(rawValue: string) {
            self = .operator(`operator`)
        } else if let parenthese = Term.ParenthesesType(rawValue: string) {
            self = .parenthese(parenthese)
        } else if let number = Int(string) {
            self = .number(number)
        } else {
            return nil
        }
    }
}

extension Term: CustomStringConvertible {
    var description: String {
        switch self {
        case .number(let number):         return String(number)
        case .operator(let `operator`):   return `operator`.rawValue
        case .parenthese(let parenthese): return parenthese.rawValue
        }
    }
}

extension Term: Equatable {
    static func ==(lhs: Term, rhs: Term) -> Bool {
        return lhs.description == rhs.description
    }
}
