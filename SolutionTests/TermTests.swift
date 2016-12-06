import XCTest
@testable import Solution

class TermTests: XCTestCase {
    
    // MARK: Equality
    
    func testEqual_FourAndFour_ShouldBeEqual() {
        XCTAssertEqual(four, four)
    }
    
    func testEqual_FourAndFive_ShouldNotBeEqual() {
        XCTAssertNotEqual(four, five)
    }
    
    func testEqual_AdditionAndAddition_ShouldBeEqual() {
        XCTAssertEqual(addition, addition)
    }
    
    func testEqual_MultiplicationAndMultiplication_ShouldBeEqual() {
        XCTAssertEqual(multiplication, multiplication)
    }
    
    func testEqual_SubtractionAndSubtraction_ShouldBeEqual() {
        XCTAssertEqual(subtraction, subtraction)
    }
    
    func testEqual_OpenAndOpen_ShouldBeEqual() {
        XCTAssertEqual(open, open)
    }
    
    func testEqual_OpenAndClosed_ShouldNotBeEqual() {
        XCTAssertNotEqual(open, closed)
    }
    
    func testEqual_AdditionAndSubtraction_ShouldBNoteEqual() {
        XCTAssertNotEqual(addition, subtraction)
    }
    
    // MARK: init(string:)
    
    func testInit_FourString_ShouldReturnNumberFour() {
        let fourFromString = Term(string: "4")
        
        XCTAssertEqual(fourFromString, four)
    }
    
    func testInit_AdditionString_ShouldReturnAddition() {
        let additionFromString = Term(string: "+")
        
        XCTAssertEqual(additionFromString, addition)
    }
    
    func testInit_SubtractionString_ShouldReturnSubtraction() {
        let subtractionFromString = Term(string: "-")
        
        XCTAssertEqual(subtractionFromString, subtraction)
    }
    
    func testInit_MultiplicationString_ShouldReturnMultiplucation() {
        let MultiplicationFromString = Term(string: "*")
        
        XCTAssertEqual(MultiplicationFromString, multiplication)
    }
    
    func testInit_OpenString_ShouldReturnOpenParenthese() {
        let OpenFromString = Term(string: "(")
        
        XCTAssertEqual(OpenFromString, open)
    }
    
    func testInit_ClosedString_ShouldReturnClosedParenthese() {
        let closedFromString = Term(string: ")")
        
        XCTAssertEqual(closedFromString, closed)
    }
    
    func testInit_QuestionMarkString_ShouldReturnNil() {
        let questionMarkFromString = Term(string: "?")
        
        XCTAssertNil(questionMarkFromString)
    }
    
    // MARK: description
    
    func testDescription_NumberFour_ShouldReturnNumberFourString() {
        let fourString = four.description
        
        XCTAssertEqual(fourString, "4")
    }
    
    func testDescription_Addition_ShouldReturnAdditionString() {
        let additionString = addition.description
        
        XCTAssertEqual(additionString, "+")
    }
    
    func testDescription_Multiplication_ShouldReturnMultiplactionString() {
        let multiplicationString = multiplication.description
        
        XCTAssertEqual(multiplicationString, "*")
    }
    
    func testDescription_Open_ShouldReturnOpenString() {
        let openString = open.description
        
        XCTAssertEqual(openString, "(")
    }
    
    func testDescription_Subtraction_ShouldReturnSubtractionString() {
        let subtractionString = subtraction.description
        
        XCTAssertEqual(subtractionString, "-")
    }
}
