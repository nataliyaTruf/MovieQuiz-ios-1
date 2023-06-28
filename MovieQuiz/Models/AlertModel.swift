//
//  AlertModel.swift
//  MovieQuiz
//
//  Created by Nataliya MASSOL on 22/06/2023.
//

import Foundation

struct AlertModel {
    let title: String
    let message: String
    let buttonText: String
    let completion: (() -> Void)?
}
