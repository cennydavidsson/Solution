import Foundation


/// A representation of a simple mathematical expression. It requires you to be explicit so you do need for example to put an operator before every parenthesis.
struct Expression {
    fileprivate var terms: [Term] = []
    
    /// To check if the expression is a correct state and can be calculated. Example '4+5' is correct and '4+' is not.
    var correct: Bool {
        guard isParenthesClosed     else { return false }
        guard let last = terms.last else { return true }
        if case .operator = last {
            return false
        }
        return true
    }
    
    private var isParenthesClosed: Bool {
         return terms.filter { $0 == .parenthese(.open) }.count <=
                terms.filter { $0 == .parenthese(.closed) }.count
    }
    
    func calculate() -> Int? {
        guard !terms.isEmpty else { return 0 }
        guard correct        else { return .none }
        
        let mathExpression = NSExpression(format: description)
        let mathValue = mathExpression.expressionValue(with: .none, context: .none) as? Int
        return mathValue
    }
    
    func can(enter term: Term) -> Bool {
        switch (terms.last, term) {
        case (.some(.number), .number),
             (.some(.operator), .operator),
             (.some(.operator), .parenthese(.closed)),
             (.none, .operator),
             (.none, .parenthese(.closed)),
             (.some, .parenthese(.closed)) where isParenthesClosed:
            return false
        default:
            return true
        }
    }
    
    @discardableResult
    mutating func enter(_ term: Term) -> Bool {
        guard can(enter: term) else { return false }
        terms += [term]
        return true
    }
        
    mutating func clearEntry() {
        guard !terms.isEmpty else { return }
        terms.removeLast()
    }
    
    mutating func clearAll() {
        terms.removeAll()
    }
}

extension Expression: CustomStringConvertible {
    var description: String {
        return terms
            .map { $0.description }
            .reduce("", +)
    }
}

extension Expression: Equatable {
    static func ==(lhs: Expression, rhs: Expression) -> Bool {
        return lhs.calculate() == rhs.calculate()
    }
}

extension Expression: Comparable {
    static func <(lhs: Expression, rhs: Expression) -> Bool {
        return (lhs.calculate() ?? 0) < (rhs.calculate() ?? 0)
    }
}
