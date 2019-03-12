//
//  Question.swift
//  Quizzler
//
//  Created by murad on 12/03/2019.
//  Copyright © 2019 murad. All rights reserved.
//

import Foundation

class Question {
    
    let questionText: String
    let answer: Bool
    
    init(text: String, correctAnswer: Bool) {
        questionText = text
        answer = correctAnswer
    }
    
}
