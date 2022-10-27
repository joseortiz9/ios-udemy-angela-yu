//
//  QuizBrain.swift
//  Quizzler-iOS13
//
//  Created by Jose Ortiz on 10/26/22.
//  Copyright © 2022 The App Brewery. All rights reserved.
//

import Foundation

struct QuizBrain {
    
    let quiz = [
        Question(q: "1 + 1 = 2", a: "True"),
        Question(q: "1 + 1 = 3", a: "False"),
        Question(q: "1 * 1 > 0", a: "True"),
        Question(q: "2 + 3 ^ 0 = 0", a: "True"),
        Question(q: "1 - 4 = 0", a: "True"),
        Question(q: "1 / 1 < 0", a: "True"),
    ]
    
    var currQuestionIndex = 0
    var score = 0
    
    func getCurrentQuestion() -> Question {
        return quiz[currQuestionIndex]
    }
    
    func getCurrProgress() -> Float {
        return Float(currQuestionIndex + 1) / Float(quiz.count)
    }
    
    mutating func checkAnswer(_ userAnswer: String)-> Bool {
        let result = userAnswer == getCurrentQuestion().answer
        if result {
            self.score += 1
        }
        return result
    }
    
    mutating func nextQuestion() {
        if currQuestionIndex < quiz.count - 1 {
            self.currQuestionIndex += 1
        } else {
            self.score = 0
            self.currQuestionIndex = 0
        }
    }
}
