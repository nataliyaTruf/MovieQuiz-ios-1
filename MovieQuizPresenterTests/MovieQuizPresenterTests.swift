//
//  MovieQuizPresenterTests.swift
//  MovieQuizPresenterTests
//
//  Created by Nataliya MASSOL on 23/07/2023.
//
import XCTest
@testable import MovieQuiz

final class MovieQuizViewControllerMock: MovieQuizViewControllerProtocol {
  
    func show(quiz step: QuizStepViewModel) {
    
    }
    
    func showFinalResults() {
    
    }
    
    func highlightImageBorder(isCorrectAnswer: Bool) {
    
    }
    
    func hideImageBorder() {
    }
    
    func showLoadingIndicator() {
    
    }
    
    func hideLoadingIndicator() {
    
    }
    
    func buttonsLocked() {
        
    }
    
    func buttonsUnlocked() {
        
    }
    
    func showNetworkError(message: String) {
    
    }
    
    func showImageLoadingError(message: String) {
        
    }
}

final class MovieQuizPresenterTests: XCTestCase {
    func testPresenterConvertModel() throws {
        let viewControllerMock = MovieQuizViewControllerMock()
        let sut = MovieQuizPresenter(viewController: viewControllerMock)
        
        let emptyData = Data()
        let question = QuizQuestion(image: emptyData, text: "Question Text", correctAnswer: true)
        let viewModel = sut.convert(model: question)
        
        XCTAssertNotNil(viewModel.image)
        XCTAssertEqual(viewModel.question, "Question Text")
        XCTAssertEqual(viewModel.questionNumber, "1/10")
    }
}
