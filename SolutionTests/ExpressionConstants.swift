import XCTest
@testable import Solution

let emptyExpression                     = Expression()
let zeroExpression                      = Expression.create(terms: [zero])
let threeExpression                     = Expression.create(terms: [three])
let fourPlusFive                        = Expression.create(terms: [four, addition, five])
let fivePlusFour                        = Expression.create(terms: [five, addition, four])
let fivePlusOpenFour                    = Expression.create(terms: [five, addition, open, four])
let fourMinusFive                       = Expression.create(terms: [four, subtraction, five])
let fourMinus                           = Expression.create(terms: [four, subtraction])
let fiveTimesOpenFourPlusSevenClosed    = Expression.create(terms: [five, multiplication, open, four, addition, seven, closed])

extension Expression {
    static func create(terms: [Term]) -> Expression {
        return terms.reduce(Expression()) { (expression, term) in expression.enterd(term) }
    }
    
    func enterd(_ term: Term) -> Expression {
        var expression = self
        expression.enter(term)
        return expression
    }
}
