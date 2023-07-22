//
//  MovieQuizPresenter.swift
//  MovieQuiz
//
//  Created by Nataliya MASSOL on 22/07/2023.
//

import UIKit

final class MovieQuizPresenter {
       
    private var currentQuestionIndex: Int = 0
    let questionsAmount: Int = 10
    var currentQuestion: QuizQuestion?
    weak var viewController: MovieQuizViewController?
    
    var questionFactory: QuestionFactoryProtocol?
    var correctAnswers: Int = 0
    
    func convert(model: QuizQuestion) -> QuizStepViewModel {
        
        return QuizStepViewModel(
            image: UIImage(data: model.image) ?? UIImage(),
            question: model.text,
            questionNumber: "\(currentQuestionIndex + 1)/\(questionsAmount)")
    }
    
    func isLastQuestion() -> Bool {
        currentQuestionIndex == questionsAmount - 1
    }
    
    func resetQuestionIndex() {
        currentQuestionIndex = 0
    }
    
    func switchToNextQuestion() {
        currentQuestionIndex += 1
    }
    
  func noButtonClicked() {
   didAnswer(isYes: false)
    }
    
func yesButtonClicked() {
        didAnswer(isYes: true)
    }
    
    private func didAnswer(isYes: Bool) {
        guard let currentQuestion = currentQuestion else {
            return
        }        
        let givenAnswer = isYes
        
      viewController?.showAnswerResult(isCorrect: givenAnswer == currentQuestion.correctAnswer)
    }
    
    func didRecieveNextQuestion(question: QuizQuestion?) {
        guard let question = question else { return }
        
        currentQuestion = question
        let viewModel = convert(model: question)
        
        DispatchQueue.main.async { [weak self] in
            self?.viewController?.show(quiz: viewModel)
        }
    }
    func showNextQuestionOrResults() {
        if self.isLastQuestion() {
            viewController?.showFinalResults()
        } else {
            self.switchToNextQuestion()
            questionFactory?.requestNextQuestion()
        }
//        DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) { [weak self] in
//            guard let self = self else { return }
//            self.imageView.layer.borderWidth = 0
//            self.yesButton.isEnabled = true
//            self.noButton.isEnabled = true
//        }
    }
}





