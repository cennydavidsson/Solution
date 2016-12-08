import XCTest
@testable import Solution

class ExpressionTests: XCTestCase {
    
    // MARK: Equality
    
    func testEqual_EmptyAndEmpty_ShouldReturnTrue() {
        XCTAssertEqual(emptyExpression, emptyExpression)
    }
    
    func testEqual_EmptyAndZero_ShouldReturnTrue() {
        XCTAssertEqual(emptyExpression, zeroExpression)
    }
    
    func testEqual_FourPlusFiveAndFivePlusFour_ShouldReturnTrue() {
        XCTAssertEqual(fourPlusFive, fivePlusFour)
    }
    
    func testEqual_FourPlusFiveAndFourMinusFive_ShouldReturnFalse() {
        XCTAssertNotEqual(fourPlusFive, fourMinusFive)
    }
    
    // MARK: compare
    
    func testCompare_FourPlusFiveGreaterThanFourMinusFive_ShouldReturnTrue() {
        XCTAssertGreaterThan(fourPlusFive, fourMinusFive)
    }
    
    func testCompare_FourPlusFiveGreaterThanIncorrect_ShouldReturnTrue() {
        XCTAssertGreaterThan(fourPlusFive, fivePlusOpenFour)
    }
    
    // MARK: description
    
    func testDescription_Empty_ShouldReturnEmpty() {
        let description = emptyExpression.description
        
        XCTAssertEqual(description, "")
    }

    func testDescription_Zero_ShouldReturnZero() {
        let description = zero.description
        
        XCTAssertEqual(description, "0")
    }
    
    func testDescription_Three_ShouldReturnThree() {
        let description = three.description
        
        XCTAssertEqual(description, "3")
    }
    
    func testDescription_FourPlusFive_ShouldReturnFourPlusFive() {
        let description = fourPlusFive.description
        
        XCTAssertEqual(description, "4+5")
    }
    
    func testDescription_FiveOpenPlusFour_ShouldReturnFiveOpenPlusFour() {
        let description = fivePlusOpenFour.description
        
        XCTAssertEqual(description, "5+(4")
    }
    
    func testDescription_FiveTimesOpenFourPlusSevenClosed_ShouldReturnFiveTimesOpenFourPlusSevenClosed() {
        let description = fiveTimesOpenFourPlusSevenClosed.description
        
        XCTAssertEqual(description, "5*(4+7)")
    }

    // MARK: correct
    
    func testCorrect_Empty_ShouldReturnTrue() {
        let result = emptyExpression.correct
        
        XCTAssertTrue(result)
    }
    
    func testCorrect_FourPlusFive_ShouldReturnTrue() {
        let result = fourPlusFive.correct
        
        XCTAssertTrue(result)
    }
    
    func testCorrect_FiveOpenPlusFour_ShouldReturnFalse() {
        let result = fivePlusOpenFour.correct
        
        XCTAssertFalse(result)
    }
    
    func testCorrect_FourMinus_ShouldReturnFalse() {
        let result = fourMinus.correct
        
        XCTAssertFalse(result)
    }
    
    // MARK: can(enter:)
    
    func testCanEnter_AdditonToEmpty_ShouldReturnFalse() {
        let result = emptyExpression.can(enter: addition)
        
        XCTAssertFalse(result)
    }
    
    func testCanEnter_OpenToEmpty_ShouldReturnTrue() {
        let result = emptyExpression.can(enter: open)
        
        XCTAssertTrue(result)
    }
    
    func testCanEnter_OperatorToClosed_ShouldReturnTrue() {
        let result = fiveTimesOpenFourPlusSevenClosed.can(enter: addition)
        
        XCTAssertTrue(result)
    }
    
    func testCanEnter_ClosedToEmpty_ShouldReturnFalse() {
        let result = emptyExpression.can(enter: closed)
        
        XCTAssertFalse(result)
    }
    
    func testCanEnter_ClosedToOpenExpression_ShouldReturnTrue() {
        let result = fivePlusOpenFour.can(enter: closed)
        
        XCTAssertTrue(result)
    }
    
    // MARK enter
    
    func testEnter_ClosedToOpenExpression_ShouldEnterClosed() {
        var fivePlusOpenFourCopy = fivePlusOpenFour
        
        fivePlusOpenFourCopy.enter(closed)
        
        XCTAssertEqual(fivePlusOpenFourCopy.description, "5+(4)")
    }
    
    func testEnter_ClosedToOpenExpression_ShouldReturnTrue() {
        var fivePlusOpenFourCopy = fivePlusOpenFour
        let didEnter = fivePlusOpenFourCopy.enter(closed)
        
        XCTAssertTrue(didEnter)
    }
    
    func testEnter_ClosedToClosedExpression_ShouldDoNothing() {
        var fivePlusOpenFourCopy = fivePlusOpenFour
        fivePlusOpenFourCopy.enter(closed)
        fivePlusOpenFourCopy.enter(closed)
        
        XCTAssertEqual(fivePlusOpenFourCopy.description, "5+(4)")
    }
    
    func testEnter_ClosedToClosedExpression_ShouldReturnFalse() {
        var _fivePlusOpenFour = fivePlusOpenFour
        _fivePlusOpenFour.enter(closed)
        let didEnter = _fivePlusOpenFour.enter(closed)
        
        XCTAssertFalse(didEnter)
    }
    
    // MARK: clearEntry
    
    func testClearEntry_Expression_ShouldRemoveLastEntry() {
        var _fivePlusOpenFour = fivePlusOpenFour
        
        _fivePlusOpenFour.clearEntry()
        
        XCTAssertEqual(_fivePlusOpenFour.description, "5+(")
    }
    
    func testClearEntry_Empty_ShouldDoNothing() {
        var _emptyExpression = emptyExpression
        _emptyExpression.clearEntry()
        
        XCTAssertEqual(_emptyExpression.description, "")
    }
    
    // MARK: clearAll
    
    func testClearAll_Empty_ShouldDoNothing() {
        var _emptyExpression = emptyExpression
        _emptyExpression.clearAll()
        
        XCTAssertEqual(_emptyExpression.description, "")
    }
    
    func testClearAll_FourPlusFive_ShouldClearAll() {
        var _fourPlusFive = fourPlusFive
        _fourPlusFive.clearAll()
        
        XCTAssertEqual(_fourPlusFive.description, "")
    }
    
    // MARK: calculate
    
    func testCalculate_Empty_ShouldCalculateToZero() {
        let result = emptyExpression.calculate()
        
        XCTAssertEqual(result, 0)
    }
    
    func testCalculate_Zero_ShouldCalculateToZero() {
        let result = zeroExpression.calculate()
        
        XCTAssertEqual(result, 0)
    }

    func testCalculate_Three_ShouldCalculateToThree() {
        let result = threeExpression.calculate()
        
        XCTAssertEqual(result, 3)
    }
    
    func testCalculate_FourPlusFive_ShouldCalculateToNine() {
        let result = fourPlusFive.calculate()
        
        XCTAssertEqual(result, 9)
    }
    
    func testCalculate_FourMinusFive_ShouldCalculateToOne() {
        let result = fourMinusFive.calculate()
        
        XCTAssertEqual(result, -1)
    }
    
    func testCalculate_FivePlusOpenFour_ShouldReturnNil() {
        let result = fivePlusOpenFour.calculate()
        
        XCTAssertNil(result)
    }
}
