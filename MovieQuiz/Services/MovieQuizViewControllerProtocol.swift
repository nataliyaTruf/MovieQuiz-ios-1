//
//  MovieQuizViewControllerProtocol.swift
//  MovieQuiz
//
//  Created by Nataliya MASSOL on 23/07/2023.
//

import Foundation

protocol MovieQuizViewControllerProtocol: AnyObject {
    func show(quiz step: QuizStepViewModel)
    func showFinalResults()
    
    func highlightImageBorder(isCorrectAnswer: Bool)
    func hideImageBorder()
    
    func buttonsLocked()
    func buttonsUnlocked()
    
    func showLoadingIndicator()
    func hideLoadingIndicator()
    
    func showNetworkError(message: String)
    func showImageLoadingError(message: String)
}
