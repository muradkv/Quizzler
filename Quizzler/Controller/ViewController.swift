//
//  ViewController.swift
//  Quizzler
//
//  Created by murad on 24.09.2024.
//

import UIKit

class ViewController: UIViewController {
    
    //MARK: - Properties
    
    private let mainView = MainView()
    private var quizData = QuestionData()
        
    //MARK: - Life cycle
    
    override func loadView() {
        view = mainView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupButtons()
        updateUI()
    }
    
    //MARK: - Methods
    
    private func setupButtons() {
        mainView.trueButton.addAction(UIAction(handler: { [weak self] action in
            self?.buttonPressed(sender: self?.mainView.trueButton)
        }), for: .touchUpInside)
        
        mainView.falseButton.addAction(UIAction(handler: { [weak self] action in
            self?.buttonPressed(sender: self?.mainView.falseButton)
        }), for: .touchUpInside)
    }
    
    private func buttonPressed(sender: UIButton?) {
        guard let userAnswer = sender?.currentTitle else { return }
        let userGotItRight = quizData.checkAnswer(userAnswer)
        
        if userGotItRight {
            sender?.backgroundColor = .green
        } else {
            sender?.backgroundColor = .red
        }
        
        quizData.nextQuestion()
        updateUI()
    }
    
    private func updateUI() {
        let textLabel = quizData.getQuestionText()
        mainView.updateTextLabel(text: textLabel)
        
        let progressNumber = quizData.getProgress()
        mainView.updateProgressView(progress: progressNumber)
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) { [weak self] in
            self?.mainView.trueButton.backgroundColor = .clear
            self?.mainView.falseButton.backgroundColor = .clear
        }
    }
}

