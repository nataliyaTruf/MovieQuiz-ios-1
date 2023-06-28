//
//  QuestionFactory.swift
//  MovieQuiz
//
//  Created by Nataliya MASSOL on 16/06/2023.
//

import Foundation

final class QuestionFactory: QuestionFactoryProtocol {
    
    // MARK: - Prorerties
    
    private weak var delegate: QuestionFactoryDelegate?
    
    // MARK: - Init
    
    init(delegate: QuestionFactoryDelegate?) {
        self.delegate = delegate
    }
    
    // MARK: - Functions
    
    func requestNextQuestion() {
        guard let index = (0..<questions.count).randomElement() else {
            delegate?.didRecieveNextQuestion(question: nil)
            assertionFailure("question is empty")
            return
        }
        
        let question = questions[safe: index]
        delegate?.didRecieveNextQuestion(question: question)
    }
}

private let questions: [QuizQuestion] = [
    QuizQuestion(
        image: "The Godfather",
        text: "Рейтинг этого фильма больше чем 6?",
        correctAnswer: true),
    QuizQuestion(
        image: "The Dark Knight",
        text: "Рейтинг этого фильма больше чем 6?",
        correctAnswer: true),
    QuizQuestion(
        image: "Kill Bill",
        text: "Рейтинг этого фильма больше чем 6?",
        correctAnswer: true),
    QuizQuestion(
        image: "The Avengers",
        text: "Рейтинг этого фильма больше чем 6?",
        correctAnswer: true),
    QuizQuestion(
        image: "Deadpool",
        text: "Рейтинг этого фильма больше чем 6?",
        correctAnswer: true),
    QuizQuestion(
        image: "The Green Knight",
        text: "Рейтинг этого фильма больше чем 6?",
        correctAnswer: true),
    QuizQuestion(
        image: "Old",
        text: "Рейтинг этого фильма больше чем 6?",
        correctAnswer: false),
    QuizQuestion(
        image: "The Ice Age Adventures of Buck Wild",
        text: "Рейтинг этого фильма больше чем 6?",
        correctAnswer: false),
    QuizQuestion(
        image: "Tesla",
        text: "Рейтинг этого фильма больше чем 6?",
        correctAnswer: false),
    QuizQuestion(
        image: "Vivarium",
        text: "Рейтинг этого фильма больше чем 6?",
        correctAnswer: false)
]
