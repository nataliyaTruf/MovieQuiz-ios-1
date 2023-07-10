//
//  QuestionFactoryDelegate.swift
//  MovieQuiz
//
//  Created by Nataliya MASSOL on 22/06/2023.
//

import Foundation

protocol QuestionFactoryDelegate: AnyObject {
    func didRecieveNextQuestion(question: QuizQuestion?)
    func didLoadDataFromServer()
    func didFailToLoadData(with error: Error)
}
