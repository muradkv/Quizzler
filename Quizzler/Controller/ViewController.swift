//
//  ViewController.swift
//  Quizzler
//
//  Created by murad on 11/03/2019.
//  Copyright © 2019 murad. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    let allQuestions = QuestionBank()
    var pickedAnswer: Bool = true
    var questionNumber = 0
    
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var progressLabel: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var progressBar: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        questionLabel.text = allQuestions.list[0].questionText
    }

    @IBAction func answerPressed(_ sender: UIButton) {
        
        if sender.tag == 1 {
            pickedAnswer = true
        } else {
            pickedAnswer = false 
        }
        
        checkAnswer()
        
        questionNumber += 1
        
        nextQuestion()
        
    }
    
    func checkAnswer() {
        
        if pickedAnswer == allQuestions.list[questionNumber].answer {
            print("You are right!")
        } else {
            print("You are wrong!")
        }
        
    }
    
    func nextQuestion() {
        
        if questionNumber > 12 {
            questionNumber = 0
        }
        
        questionLabel.text = allQuestions.list[questionNumber].questionText
        
    }
    
}

