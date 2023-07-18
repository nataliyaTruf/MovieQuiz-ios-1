//
//  MovieQuizTests.swift
//  MovieQuizTests
//
//  Created by Nataliya MASSOL on 14/07/2023.
//

import XCTest

struct ArithmeticOperations {
    func addition(num1: Int, num2: Int, handler: @escaping (Int) -> Void) {
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
            handler(num1 + num2)
        }
    }
    
    func substraction(num1: Int, num2: Int, handler: @escaping (Int) -> Void) {
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
            handler(num1 - num2)
        }
    }
    
    func multiplication(num1: Int, num2: Int, handler: @escaping (Int) -> Void) {
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
            handler(num1 * num2)
        }
    }
}

final class MovieQuizTests: XCTestCase {
    func testAddition() throws {
        // Given
        let arithmeticOperations = ArithmeticOperations()
        let num1 = 1
        let num2 = 2
        
        // When
        let expectation = expectation(description: "Addition function expectation")
        arithmeticOperations.addition(num1: num1, num2: num2) { result in
            
            // Then
            XCTAssertEqual(result, 3)
            expectation.fulfill()
        }
        waitForExpectations(timeout: 2)
    }
    func testSubstraction() throws {
        // Given
        let arithmeticOperation = ArithmeticOperations()
        let num1 = 3
        let num2 = 2
        
        // When
        let expectation = expectation(description: "Substraction function expectation")
        arithmeticOperation.substraction(num1: num1, num2: num2) { result in
            // Than
            XCTAssertEqual(result, 1)
            expectation.fulfill()
        }
        waitForExpectations(timeout: 2)
    }
    
    func testMultiplication() throws {
        // Given
        let arithmeticOperation = ArithmeticOperations()
        let num1 = 2
        let num2 = 3
        
        // Wnen
        let expectation = expectation(description: "Multiplication function operation")
        arithmeticOperation.multiplication(num1: num1, num2: num2) { result in
            // Then
            XCTAssertEqual(result, 6)
            expectation.fulfill()
        }
        waitForExpectations(timeout: 2)
    }
}
